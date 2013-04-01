testing
test01TokenizeNodes

	self saxTokenizeBlastNodes: #hits01.						
	self assert: (result isKindOf: OrderedCollection).
	self deny: result isEmpty.
	self assert: result first = '1'.
	