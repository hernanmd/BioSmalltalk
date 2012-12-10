test
testRowColumnSize
	"comment stating purpose of message"

	| m |
	m := self matrixClass rows: 3 columns: 7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3@7).