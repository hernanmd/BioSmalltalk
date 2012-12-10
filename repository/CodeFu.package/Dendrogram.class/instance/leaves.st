accessing
leaves

	| stream |
	stream := Array new writeStream.
	self leavesDo: [ :each | stream nextPut: each ].
	^stream contents