instance creation
filesFromXMLDirectory: aDirectoryString
	" Answer a Collection of readers iterating over the files located at aDirectoryString "

	^ ( self fileDirectoryContentsFor: aDirectoryString ) asFileCollection
			select: [: file | file isXML ]
			thenCollect: [: file | self newFromXML: file ]