testing
testAccessNode

	| nodeContents |
	
	reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
	
	nodeContents := reader accessNode: 'Iteration_iter-num'.
	self assert: ( nodeContents isKindOf: Collection ).
	self assert: nodeContents anyOne = '1'.
	
	nodeContents := reader accessNode: 'Hit_def'.
	self assert: ( nodeContents isKindOf: Collection ).
	self assert: nodeContents size = 100.
	self assert: ( nodeContents allSatisfy: [: str | str beginsWith: 'Bos' ] )

