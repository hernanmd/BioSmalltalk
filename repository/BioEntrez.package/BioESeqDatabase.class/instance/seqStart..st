accessing
seqStart: aBaseNumber
	" Show sequence starting from this base number "
	
	self client addParameters: '&seq_start=' , aBaseNumber asString