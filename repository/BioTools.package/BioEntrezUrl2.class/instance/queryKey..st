accessing
queryKey: aKeyString
	" Append aKeyString for setting the remote query key "

	aKeyString isEmpty
		ifFalse: [ self queryAt: 'query_key' put: aKeyString ]
		ifTrue: [ BioObject signalInvalidObject: 'Missing remote query key'  ]