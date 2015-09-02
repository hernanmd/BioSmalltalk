accessing
exportFrom: aCollection
	" Iterate aCollection storing the corresponding CSV format for each item. Output the resulting stream in a new timestamped file in the receiver's directory "
	
	self initializeStream: aCollection.
	aCollection do: [: each |
			each dumpCSVTo: stream.
			stream cr ].
	self 
		dumpToFileNamedFullPath: self outputFilename 
		contents: stream contents