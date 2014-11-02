accessing
dbGeneticCode: aSmallInteger
	" Database genetic code (PROGRAM=tblast[nx] only) "
	
	((aSmallInteger asNumber between: 1 and: 16) or: [ aSmallInteger asNumber = 21 or: [ aSmallInteger asNumber = 22 ] ])
		ifTrue: [ self clientUrl queryAt: 'DB_GENETIC_CODE' put: aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]