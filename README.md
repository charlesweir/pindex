#pindex#
========

#### pinboard.in OS X spotlight indexer ####

**Updated 2019 by Charles Weir to support latest Pinboard format and to run as script**

This requires an account with the excellent bookmarking service http://pinboard.in and OS X.

It downloads and stores each bookmark as a separate .url file with all of the meta data included so OS X spotlight will index it properly, and when you click on the file it will open in your default browser.

It uses the first 100 characters of the description as the filename, and it will overwrite the file if it already exists.

Usage (from command line):

   pindex.rb 

## License  ##

[MIT License](http://kylemiller.com/mit-license)
