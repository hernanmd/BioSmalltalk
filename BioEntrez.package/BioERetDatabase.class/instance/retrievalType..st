accessing retrieval types
retrievalType: aString
	" Private - Set the receiver's retrieval mode to aString "
	
	self client queryAt: 'rettype' put: aString