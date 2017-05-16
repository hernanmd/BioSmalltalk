accessing
retMax: aNumber
	" Set the receiver's number of records to be retrieved to aNumber "
	
	self client queryAt: 'retmax' put: aNumber asString