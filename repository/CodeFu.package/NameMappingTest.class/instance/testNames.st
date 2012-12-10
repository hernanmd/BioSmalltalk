test
testNames

	| m |
	m := NameMapping withAll: #(a b c d).

	self assert: (m equalsTo: #(1 2 3 4)).	
	self assert: (m names equalsTo: #(a b c d)).