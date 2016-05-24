accessing
readRSaxFile: entry index: index

	| fref | 
	fref := entry asFileReference.
	fref readStreamDo: [ : reportStream |
		self 
			readRSaxStream: reportStream 
			fileName: fref 
			index: index  ] 

