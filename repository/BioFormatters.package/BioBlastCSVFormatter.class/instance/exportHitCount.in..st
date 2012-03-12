exporting
exportHitCount: anInteger in: stream

	anInteger timesRepeat: [ 
		stream 
			nextPut: self delimiterSourceCharacter;
			nextPut: $. ].