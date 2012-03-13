accessing
commandLineForFormat: outputFormat

	| file |
	file := self outputFileNameFor: outputFormat.
	
	^ String streamContents:
		[:stream |
		stream
			nextPut: $";
			nextPutAll: self dotFileName;
			nextPutAll: '" -T';
			nextPutAll: outputFormat;
			nextPutAll: ' -o "';
			nextPutAll: file;
			nextPut: $"]