accessing
emailAddress: aString
	" Append aString as the receiver's e-mail address "

	self path addLast: 'email=' , aString