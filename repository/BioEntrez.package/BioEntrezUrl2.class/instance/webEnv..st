accessing
webEnv: aWebEnvString
	" Append aWebEnvString for setting the remote web environment "

	aWebEnvString isEmpty
		ifFalse: [ self queryAt: 'WebEnv' put: aWebEnvString ]
		ifTrue: [ BioObject signalInvalidObject: 'Missing remote web environment id'  ]		