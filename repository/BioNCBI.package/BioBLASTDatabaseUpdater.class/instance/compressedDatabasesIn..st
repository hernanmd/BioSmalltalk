updating
compressedDatabasesIn: aCollection
	" Answer a Collection with items corresponding to recognized database files "
	
	^ aCollection lines select: [ : dbName | dbName endsWith: 'tar.gz' ]