setting configurations
addFrequency: aString
	" Set a value for the Frequency configuration "
	
	| configuration |
	configuration := self configurationAt: self class frequencyId.
	( configuration validate: aString )
		ifTrue: [ self at: self class frequencyId put: aString asString ]
		ifFalse: [ self gtLog: aString , ' value is not listed as a valid frequency string']
