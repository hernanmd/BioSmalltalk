exporting
fromXML: aBlastXMLString
	" Answer the resulting formatted <String>. Write a CSV file from aBlastXMLString"
	
	| hitCollection |
	
	hitCollection := ( BioParser saxParseNcbiXmlBlastNodes: aBlastXMLString ) hits.
	self initializeStream: hitCollection.
	" Write positions row "
	self exportPositions: hitCollection.
	" Write consensus row "
	self exportConsensus.
	" Write the sequences matrix "
	self exportMatrixFromBLAST: hitCollection.
	
	self writeToFile
		ifTrue: [ self outputToFile: self outputFilename contents: stream contents ].
	^ stream contents
