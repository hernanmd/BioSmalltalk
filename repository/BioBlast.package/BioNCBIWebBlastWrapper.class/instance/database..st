accessing private
database: aGTNCBIDatabase
	" Answer a GTCommandObject "

	self setPutCommand.
	cmd database: aGTNCBIDatabase dbName.
	^ cmd