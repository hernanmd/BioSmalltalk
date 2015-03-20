accessing public
term: aString
	" Set the receiver's search term to aString "
	
	self client queryAt: 'term' put: aString