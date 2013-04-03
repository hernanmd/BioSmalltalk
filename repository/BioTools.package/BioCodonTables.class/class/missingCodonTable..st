accessing
missingCodonTable: anInteger
	" Private - Throw an exception for missing codon table numbered anInteger "
	
	| exceptionString |
	
	exceptionString := String streamContents: [ : stream | 
			stream 
				nextPutAll: anInteger asString;
				space;
				nextPutAll: 'codon table not found' translated ].
	self signalNotFound: exceptionString