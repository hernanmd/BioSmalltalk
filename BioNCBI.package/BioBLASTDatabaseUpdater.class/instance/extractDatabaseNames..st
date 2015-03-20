updating
extractDatabaseNames: aCollection
	" Private - Set the receiver's database to contain only the names
	of the databases found in the repository "
	
	( self compressedDatabasesIn: aCollection )
		collect: [ : dbFullName | 
			self dbNames add: ( self extractDbNameIn: dbFullName ) ]