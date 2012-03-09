accessing
complementary
	" Answer a String with the complement of the receiver's sequence "
	
	^ ( String streamContents: [: stream |
		seq do: [: nc | 
			stream nextPut: ( self complementaryAt: nc ) ] ] ) asUppercase