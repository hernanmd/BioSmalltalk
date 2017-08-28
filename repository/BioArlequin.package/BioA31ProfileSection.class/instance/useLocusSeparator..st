setting configurations
useLocusSeparator: aCharacter
	" Set a value for the LocusSeparator configuration "
	
	| configuration |
	configuration := self configurationAt: self class locusSeparatorId.
	(configuration validate: aCharacter)
		ifTrue: [ self at: self class locusSeparatorId put: aCharacter asString ]
		ifFalse: [ self bioLog: aCharacter asString , ' value is not listed as a valid locus separator' ]
