setting configurations
addSampleNumber: aNumber
	" Set a value for the NbSamples (number of samples) configuration "
	
	| configuration |
	configuration := self configurationAt: self class sampleNumberId.
	( configuration validate: aNumber asNumber )
		ifTrue: [ self at: self class sampleNumberId put: aNumber asString ]
		ifFalse: [ self gtLog: aNumber asString , ' value out of range for NbSamples']