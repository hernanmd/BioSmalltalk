accessing
seqStop: aBaseNumber
	" Show sequence ending on this base number "
	
	self client queryAt: 'seq_stop'  put: aBaseNumber asString