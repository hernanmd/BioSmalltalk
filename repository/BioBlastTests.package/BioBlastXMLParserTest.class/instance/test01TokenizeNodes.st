testing
test01TokenizeNodes

	self saxTokenizeBlastNodes: #hits01.						
	self assert: (result isKindOf: OrderedCollection).
	self deny: result isEmpty.
	self assert: result first = 'blastn'.
	self assert: (result at: 2)  = '1'.	
	self assert: result size = 68.
	self assert: (result at: 25)  = '2'.
	