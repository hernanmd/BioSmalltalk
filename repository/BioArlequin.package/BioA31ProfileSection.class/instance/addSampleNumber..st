setting configurations
addSampleNumber: aNumber
	" Set a value for the NbSamples (number of samples) configuration "
	
	| configuration |
	configuration := self configurationAt: self class sampleNumberId.
	(configuration validate: aNumber asNumber)
		ifTrue: [ self at: self class sampleNumberId put: aNumber greaseString ]
		ifFalse: [ self bioLog: aNumber greaseString , ' value out of range for NbSamples' ]