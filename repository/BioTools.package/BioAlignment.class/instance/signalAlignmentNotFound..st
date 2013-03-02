accessing
signalAlignmentNotFound: accessionString
	" Private - Signal an exception "
	
	self signalNotFound: (String streamContents: [: stream |
		stream
			nextPutAll: 'Alignment not found for accession: ' translated;
			nextPutAll: accessionString ])