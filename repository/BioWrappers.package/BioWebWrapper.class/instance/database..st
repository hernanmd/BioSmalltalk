accessing private
database: aBioDatabase
	" Set the receiver's database to be aBioDatabase.
	Answer aBioDatabase  "

	self url dbName: aBioDatabase dbName.
	^ aBioDatabase