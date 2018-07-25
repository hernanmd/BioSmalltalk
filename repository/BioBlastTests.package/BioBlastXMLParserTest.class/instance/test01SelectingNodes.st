testing
test01SelectingNodes

	| queryRs |
	
	self saxParseBlastNodes: #hits01.
	queryRs := result hspAlignLengths.
	
	self assert: queryRs isCollection.
	self deny: queryRs isEmpty.
	self assert: queryRs size equals: 3.
	self assert: queryRs first blastValue equals: 240.
	self assert: queryRs second blastValue equals: 240.
	self assert: queryRs third blastValue equals: 99.