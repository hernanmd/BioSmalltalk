setting configurations
addEpsilonValue: aFloat
	" Set a value for the EpsilonValue configuration "
	
	| configuration |
	configuration := self configurationAt: self class epsilonValueId.
	(configuration validate: aFloat)
		ifTrue: [ self at: self class epsilonValueId put: aFloat asString ]
		ifFalse: [ self bioLog: aFloat , ' value is not listed as a valid epsilon value' ]