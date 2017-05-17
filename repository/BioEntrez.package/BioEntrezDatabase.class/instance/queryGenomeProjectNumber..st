accessing public
queryGenomeProjectNumber: aNumber
	" Answer a <String> to search the numeric unique identifier for the genome project that produced the sequence records "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aNumber asString; 
			space;
			nextPutAll: self qualifierForGenomeProject ]