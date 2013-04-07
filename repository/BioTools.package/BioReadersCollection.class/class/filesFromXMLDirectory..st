instance creation
filesFromXMLDirectory: aDirectoryString
	" Answer a new instance of the receiver with XML file contents from aDirectoryString "
	
	^ self withAll: ((BioObject filesIn: aDirectoryString) asFileCollection
			select: [ : file | file isXML ]
			thenCollect: [ : file | (BioReader for: file contents) newFromXML: file ]).