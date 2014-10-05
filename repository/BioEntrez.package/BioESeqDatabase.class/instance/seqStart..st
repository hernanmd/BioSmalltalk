accessing
seqStart: aBaseNumber
	" Show sequence starting from this base number "
	
	self client queryAt: 'seq_start' put: aBaseNumber asString