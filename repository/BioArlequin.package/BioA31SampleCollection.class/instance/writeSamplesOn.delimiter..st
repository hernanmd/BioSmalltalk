accessing
writeSamplesOn: aStream delimiter: aCharacter
	" Write the receiver's samples into aStream "
	
	aStream 
		nextPut: ${;	cr.
		self samples 
			do: [ : smp | smp writeOn: aStream delimiter: aCharacter  ]
			separatedBy: [ aStream cr ].
	aStream 
		nextPut: $}