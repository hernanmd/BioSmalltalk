accessing
seqStop: aBaseNumber
	" Show sequence ending on this base number "
	
	self client addParameters: '&seq_stop=' , aBaseNumber asString