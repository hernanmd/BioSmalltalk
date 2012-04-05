accessing
geneticCode: aSmallInteger
	" Query genetic code "
	
	( ( aSmallInteger asNumber between: 1 and: 16 ) or: [ aSmallInteger asNumber = 21 or: [ aSmallInteger asNumber = 22 ] ] )
		ifTrue: [ self clientUrl addParameters: 'GENETIC_CODE=' , aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]