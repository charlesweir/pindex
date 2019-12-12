#pindex#
========

#### pinboard.in OS X spotlight indexer ####

This requires an account with the excellent bookmarking service http://pinboard.in and OS X.

It downloads and stores each bookmark as a separate .url file with all of the meta data included so OS X spotlight will index it properly, and when you click on the file it will open in your default browser.

I suggest a cron job to run the script once a day. The script takes three parameters, username, password, and the base directory to store the xml and individual .url files.  It stores the .url files in a bookmarks directory under the baseDir.

It uses the first 100 characters of the description as the filename, and it will overwrite the file if it already exists.

I put the baseDir in my dropbox, so that my bookmarks will be automatically backed up.

Note the the basedir should have directories pinboard and pinboard/bookmarks already created.

### Sample crontab entry ###
	#min	hour	mday	month	wday	command
	15	20	*	*	*	/usr/bin/ruby /Users/foo/pindex/pindex.rb user pass /Users/foo/


## License  ##
