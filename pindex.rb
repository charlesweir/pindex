#!/usr/bin/ruby
# Script to create URL files with the appropriate timestamp for each of one's Pinboard bookmarks
# The <root directory> must have directories pinboard and pinboard/bookmarks
#
# Original from https://github.com/kamiller/pindex/
# Modified to run as executable script.

%w[benchmark pp rexml/document net/http net/https time fileutils].each { |x| require x }

# Original Usage: <script> <username> <password> <root directory>
#user = ARGV[0]
#pass = ARGV[1]
#bookmarksDir = ARGV[2]

user = "Insert pinboard username here"
pass = "Insert pinboard password Here"
bookmarksDir = "/Users/changeMe/Documents/pinboard"

xmlFile = "/tmp/bookmarks.xml"

FileUtils.rm Dir.glob(bookmarksDir + '/*.url')

http = Net::HTTP.new("api.pinboard.in",443)
req = Net::HTTP::Get.new("/v1/posts/all")
http.use_ssl = true
req.basic_auth "#{user}", "#{pass}"
response = http.request(req)

# puts("downloading bookmarks")
f = File.new(xmlFile,"w+")
f.puts response.body
f.close

xml = File.read(xmlFile)
  # puts("parsing bookmarks")
  doc, posts = REXML::Document.new(xml), []
  doc.elements.each('posts/post') do |p|
    posts << p.attributes
   
   x = "pb-"+p.attributes["description"].gsub(/[^a-z0-9-]/imu,"_")
   x = x[0,100]
   
   fn = bookmarksDir + "/" + x +".url"
    u = File.new(fn, "w")
    u.puts "[InternetShortcut]\nURL=%s\nHASH=%s\nTAGS=%s\nDATETIME=%s\nDESCRIPTION=%s\nEXTENDED=%s\nMETA=%s\nORIGIN=pinboard" % [p.attributes["href"],p.attributes["hash"],p.attributes["tag"],p.attributes["time"],p.attributes["description"],p.attributes["extended"],p.attributes["meta"]]
    u.close
    time=Time.iso8601(p.attributes["time"])
    FileUtils.touch fn, :mtime => time
     
  end
FileUtils.rm xmlFile
