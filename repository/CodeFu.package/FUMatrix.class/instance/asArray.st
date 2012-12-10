converting
asArray

	| array stream |
	array := Array new: (self rowSize * self columnSize).
	stream := WriteStream on: array.
	self do: [ :each | stream nextPut: each ].
	^array.