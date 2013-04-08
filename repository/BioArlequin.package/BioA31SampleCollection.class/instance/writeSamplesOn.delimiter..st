accessing
writeSamplesOn: aStream delimiter: aCharacter
	" Write the receiver's samples into aStream "

	aStream
		nextPut: ${;
		nextPut: Character cr.
	self samples do: [ :smp | smp writeOn: aStream delimiter: aCharacter ] separatedBy: [ aStream nextPut: Character cr ].
	aStream nextPut: $}