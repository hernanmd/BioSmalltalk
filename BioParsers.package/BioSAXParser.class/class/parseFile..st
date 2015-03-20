instance creation
parseFile: aFileName

	^ self parse: ( FileStream readOnlyFileNamed: aFileName ).
