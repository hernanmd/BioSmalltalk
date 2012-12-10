test
testAddDuplicate

	| m |
	m := NameMapping withAll: #(a b c d).
	
	self should: [ m add: #a ] raise: Error