instance creation
filesFromFlatDirectory: aDirectoryString
	" Answer a Collection of readers iterating over the files located at aDirectoryString "

	^ ( self fileDirectoryContentsFor: aDirectoryString ) asFileCollection
			select: [: file | file isGenBankFlatFormat ]
			thenCollect: [: file | self newFromFlatFormat: file ]