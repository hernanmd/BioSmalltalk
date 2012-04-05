accessing
database: aString
	" Database name. aString should be a valid database name "
	
	self clientUrl addParameters: 'DATABASE=' , aString