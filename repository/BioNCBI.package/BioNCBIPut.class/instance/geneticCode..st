accessing
geneticCode: aSmallInteger
	" Set the query genetic code "
	
	((aSmallInteger asNumber between: 1 and: 16) or: [ aSmallInteger asNumber = 21 or: [ aSmallInteger asNumber = 22 ] ] )
		ifTrue: [ self clientUrl queryAt: 'GENETIC_CODE' put: aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]