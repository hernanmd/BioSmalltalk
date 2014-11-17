accessing
exportFrom: aCollection features: featuresCollection 

	self initializeStream: aCollection.
	aCollection associationsDo: [ : assoc |
		stream 
			nextPutAll: assoc key;
			nextPut: self delimiterSourceCharacter;
			nextPutAll: assoc value size asString;
			cr ].
	self 
		outputToFile: self outputFilename 
		contents: stream contents		