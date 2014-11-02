accessing
database: aString
	" Set the database parameter. Database name aString should be a valid database name "
	
	self clientUrl queryAt: 'DATABASE' put: aString