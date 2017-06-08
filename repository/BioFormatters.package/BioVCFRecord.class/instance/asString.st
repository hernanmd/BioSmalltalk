converting
asString
	" Answer a <String> with the receiver's printed representation "

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self chromosome asString;
			nextPut: self delimiter;
			nextPutAll: self position asString;
			nextPut: self delimiter;
			nextPutAll: self id asString;
			nextPut: self delimiter;
			nextPutAll: self refBase;
			nextPut: self delimiter;
			nextPutAll: self altBase;
			nextPut: self delimiter;
			nextPutAll: self infoString;
			nextPut: self delimiter;
			nextPutAll: self delimiter;
			nextPut: self delimiter;
			nextPutAll: self formatString;
			nextPut: self delimiter;
			nextPutAll: self genotypesString ]