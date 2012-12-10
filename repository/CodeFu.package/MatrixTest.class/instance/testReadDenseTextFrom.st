test
testReadDenseTextFrom

	| matrix text stream |
	matrix := ArrayMatrix withAll: #( ( 2.3 0 4.2 ) ( 0 1.3 2.2 ) ( 3.8 0 0.5 ) ( 0 0 0 )).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.

	stream := ReadStream on: text.
	self assert: matrix = (self matrixClass readFromDenseText: stream).