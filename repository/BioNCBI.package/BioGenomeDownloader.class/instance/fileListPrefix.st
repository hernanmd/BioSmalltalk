downloading
fileListPrefix
	" Set a <String> with the prefix of the files to be downloaded "

	^ fileListPrefix
		ifNil: [ fileListPrefix := self defaultFileListPrefix ]
