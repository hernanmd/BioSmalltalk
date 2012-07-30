setting configurations
useRecessiveAllele: aString
	" Set a value for the MissingData configuration "
	
	| configuration |
	configuration := self configurationAt: self class recessiveAlleleId.
	( configuration validate: aString )
		ifTrue: [ self at: self class recessiveAlleleId put: aString asString ]
		ifFalse: [ self bioLog: aString , ' value is not listed as a valid missing data character']
