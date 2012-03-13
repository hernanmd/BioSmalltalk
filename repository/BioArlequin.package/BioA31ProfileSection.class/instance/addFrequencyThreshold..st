setting configurations
addFrequencyThreshold: aFraction
	" Set a value for the FrequencyThreshold configuration "
	
	| configuration |
	configuration := self configurationAt: self class frequencyThresholdId.
	" ToDo:  '1/10000' asNumber  "
	^ true
"	( configuration validate: aFraction )
		ifTrue: [ self at: self class frequencyThresholdId put: aFraction asString ]
		ifFalse: [ self log: aFraction asString , ' value is not listed as a valid frequency threshold'] "