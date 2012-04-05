accessing
percentOfIdentity: aSmallInteger
	" Percent of identity cut-off threshold (megablast only) "
	
	( aSmallInteger asNumber between: 0 and: 100 )
		ifTrue: [ self clientUrl addParameters: 'PERC_IDENT=' , aSmallInteger asString ]
		ifFalse: [ self signalInvalidObject: aSmallInteger asString ]