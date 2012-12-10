test
testDimension
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 3@7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3@7).