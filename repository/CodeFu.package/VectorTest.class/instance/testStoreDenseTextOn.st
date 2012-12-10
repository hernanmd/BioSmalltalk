test
testStoreDenseTextOn

	| vector text stream |
	vector := self vectorClass withAll: #( 2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0 ).
	text := '12\2.3 0 4.2 0 1.3 2.2 3.8 0 0.5 0 0 0\' withCRs.

	stream := WriteStream on: String new.
	vector storeDenseTextOn: stream.
	self assert: stream contents = text.