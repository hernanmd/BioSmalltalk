accessing
dbName: aString
	" Append aString as the receiver's database name "

	self path addLast: 'db=' , aString