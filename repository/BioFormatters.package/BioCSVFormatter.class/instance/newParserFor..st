accessing
newParserFor: filePath
	" Answer a new CSV parser "

	^ (self parserClass on: (self openFullFileNamed: filePath) readStream)
		separator: Character tab; 
		yourself