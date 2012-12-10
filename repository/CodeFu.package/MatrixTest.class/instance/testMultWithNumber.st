test
testMultWithNumber
	"comment stating purpose of message"

	| m m10 |
	m := self matrixClass withAll: #( #( 1 2 ) #( 3 4 ) #( 5 6 )).
	m10 := (self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 ))).

	self assert: (m * 10) = m10.
	self assert: (10 * m) = m10.
	m *= 10.
	self assert: m = m10.