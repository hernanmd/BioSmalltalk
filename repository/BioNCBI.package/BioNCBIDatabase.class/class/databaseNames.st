accessing
databaseNames
	" self databaseNames "
	
	^ self subclasses collect: [ : cls | cls dbName ].
