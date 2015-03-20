exporting
exportFromXML: aBlastXMLString
	" Answer the resulting formatted <String>. Write a CSV file from aBlastXMLString"
	
	| hitCollection |
	
	hitCollection := (BioParser saxParseNcbiXmlBlastNodes: aBlastXMLString) hits.
	self initializeStream: hitCollection.
	self exportPositions: hitCollection.
	self exportConsensus.
	self exportMatrixFromBLAST: hitCollection.
	self writeToFile
		ifTrue: [ self outputToFile: self outputFilename contents: stream contents ].
	^ stream contents
