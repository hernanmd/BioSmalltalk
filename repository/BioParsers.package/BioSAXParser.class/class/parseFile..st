instance creation
parseFile: aFileName
	" Parse aFileName representing a XML String as input "

	^ self parse: (FileStream readOnlyFileNamed: aFileName)