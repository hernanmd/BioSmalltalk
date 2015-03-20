exporting
exportHitCount: anInteger in: aStream

	anInteger timesRepeat: [ 
		aStream 
			nextPut: self delimiterSourceCharacter;
			nextPut: $. ].