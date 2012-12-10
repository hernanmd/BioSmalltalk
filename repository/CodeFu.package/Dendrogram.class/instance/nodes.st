accessing
nodes

	| stream |
	stream := Array new writeStream.
	self nodesDo: [ :each | stream nextPut: each ].
	^stream contents