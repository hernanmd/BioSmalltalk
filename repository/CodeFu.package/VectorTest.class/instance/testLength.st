test
testLength
	"comment stating purpose of message"

	v := self vectorClass withAll: #( 1 2 3 ).
	w := self vectorClass withAll: #( 5 -11 7 ).

	self assert: (v length) = ((1*1) + (2*2) + (3*3)) sqrt.
	self assert: (w length) = ((5*5) + (11*11) + (7*7)) sqrt.