accessing
exportFrom: aCollection features: featuresCollection 

	self initializeStream: aCollection.
	aCollection associationsDo: [ : assoc |
		stream 
			nextPutAll: assoc key;
			nextPut: self delimiterSourceCharacter;
			nextPutAll: assoc value size asString;
			bioCr ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: stream contents