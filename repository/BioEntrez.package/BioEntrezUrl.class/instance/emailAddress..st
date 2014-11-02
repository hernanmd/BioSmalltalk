accessing
emailAddress: aString
	" Append aString as the receiver's e-mail address "

	self queryAt: 'email' put: aString