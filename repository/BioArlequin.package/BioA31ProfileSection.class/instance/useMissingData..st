setting configurations
useMissingData: aCharacter
	" Set a value for the MissingData configuration "
	
	| configuration |
	
	configuration := self configurationAt: self class missingDataId.
	( configuration validate: aCharacter )
		ifTrue: [ self at: self class missingDataId put: aCharacter asString ]
		ifFalse: [ self bioLog: aCharacter , ' value is not listed as a valid missing data character']
