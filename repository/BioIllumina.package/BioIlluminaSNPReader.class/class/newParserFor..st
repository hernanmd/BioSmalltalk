instance creation
newParserFor: aFile

	^ (NeoCSVReader on: (self openFullFileNamed: aFile) readStream)
		separator: Character tab; 
		yourself