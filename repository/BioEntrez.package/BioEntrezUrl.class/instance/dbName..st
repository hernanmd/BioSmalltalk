accessing
dbName: aString
	" Append aString as the receiver's database name "

	self queryAt: 'db' put: aString
	" self path addLast: 'db=' , aString "