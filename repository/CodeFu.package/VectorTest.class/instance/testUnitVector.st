test
testUnitVector
	"comment stating purpose of message"

	self assert: (v unitVector) length asFloat = 1.0.
	self assert: ((w unitVector) length closeTo: 1.0).
	
