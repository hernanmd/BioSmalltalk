instance creation
newParserFor: aFile

	^ (STextParser on: (self openFullFileNamed: aFile))
		delimiter: Character tab; 
		ignoreHeadersCount: 10;
		yourself