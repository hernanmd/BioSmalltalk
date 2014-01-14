accessing
writeSamplesOn: aStream delimiter: aCharacter
	" Write the receiver's samples into aStream "

	aStream
		nextPut: ${;
		nextPutAll: GRPlatform current newline.
	self samples 
		do: [ :smp | smp writeOn: aStream delimiter: aCharacter ] 
		separatedBy: [ aStream nextPutAll: GRPlatform current newline ].
	aStream nextPut: $}