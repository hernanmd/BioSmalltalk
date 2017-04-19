converting
asString
	" Answer a <String> representation of the receiver "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self sequenceFeature name; 
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature sourceTag;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature primaryTag;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature start asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature end asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature score asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature strand asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature tag asString ]