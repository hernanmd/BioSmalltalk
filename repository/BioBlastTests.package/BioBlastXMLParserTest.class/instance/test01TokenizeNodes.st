testing
test01TokenizeNodes

	self saxTokenizeBlastNodes: #hits01.						
	self assert: (result isKindOf: OrderedCollection).
	self deny: result isEmpty.
	self assert: result first equals: 'blastn'.
	self assert: (result at: 2) equals: '1'.	
	self assert: result size equals: 68.
	self assert: (result at: 25) equals: '2'.
	