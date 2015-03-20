accessing
dbClassOf: aString
	" Answer the corresponding class of aString database name "

	^ self allFinalClasses 
		detect: [ : cls | cls databaseNames includes: aString ]
		ifNone: [ self signalNotFound: 'Database name not found: ' , aString ]