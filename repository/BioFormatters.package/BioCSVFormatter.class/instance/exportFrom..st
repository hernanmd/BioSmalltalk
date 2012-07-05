accessing
exportFrom: aCollection

	self initializeStream: aCollection.
	aCollection do: [: each |
			each outputAsCsvTo: stream.
			stream cr ].
	self 
		outputToFile: self outputFilename 
		contents: stream contents