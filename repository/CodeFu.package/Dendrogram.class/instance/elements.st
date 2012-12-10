accessing
elements

	| stream |
	stream := Array new writeStream.
	self elementsDo: [ :each | stream nextPut: each ].
	^stream contents