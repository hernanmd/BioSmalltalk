accessing private
cmdLine 

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self programName;
			nextPutAll: self buildParameters ]