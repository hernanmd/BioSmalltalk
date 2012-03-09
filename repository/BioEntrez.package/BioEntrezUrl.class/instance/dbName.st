accessing
dbName
	" Answer a String with the receiver's database name, if it was configured "

	^self valueForParameter: 'db'