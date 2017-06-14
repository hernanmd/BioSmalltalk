downloading
buildFileList
	" Private - Answer a <Collection> of files to download "

	self downloadFormats isEmpty 
		ifTrue: [ self downloadFormats: self defaultDownloadFormats ].
	^ self downloadFormats collect: [ : format |
		String streamContents: [ : stream | 
			stream
				nextPutAll: self fileListPrefix;
				nextPutAll: self version;
				nextPutAll: '_chr';
				nextPutAll: self chrAsString;
				nextPutAll: format ] ].