accessing private
cmdLine 

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self clustalo;
			nextPutAll: self buildParameters ]