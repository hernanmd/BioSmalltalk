accessing retrieval modes
retrievalMode: aString
	" Private - Set the receiver's retrieval mode to aString "
	
	self client queryAt: 'retmode' put: aString