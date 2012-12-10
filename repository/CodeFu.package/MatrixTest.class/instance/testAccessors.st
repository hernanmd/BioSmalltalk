test
testAccessors
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 2@3.
	m at: 1 and: 2 put: 12. 
	m at: 2 and: 1 put: 21. 
	self assert: (m at:	1 and: 2) = 12.
	self assert: (m at:	2 and: 1) = 21.
	m at: 1 and: 3 put: 13.
	self assert: (m at: 1 and: 3) = 13.
	self assert: (m atPoint: 1@3) = 13.