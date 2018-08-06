downloading
downloadFormats
	" Answer a <Collection> of <String> with file formats to be downloaded "
	
	^ downloadFormats
		ifNil: [ downloadFormats := OrderedCollection new ]
