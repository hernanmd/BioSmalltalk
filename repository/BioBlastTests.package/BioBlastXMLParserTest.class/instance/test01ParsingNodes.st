testing
test01ParsingNodes

	self parseBlastNodes: #hits03.						
	self assert: ( result isKindOf: BioBlastRootNode ).
	self assert: result nodes isCollection.
	self deny: result isEmpty.
	self assert: result size = 1.
	
	self assert: result hits isCollection.
	self deny: result hits isEmpty.
	self assert: ( result hits allSatisfy: #isHitNode ).
	