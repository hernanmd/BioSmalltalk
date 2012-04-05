accessing
databaseList			
	" self databaseList "
	
	^ self subclasses collect: [ : cls | 
		cls dbName -> cls description ].
