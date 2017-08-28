setting configurations
addDataType: aString
	" Set a value for the DataType configuration "
	
	| configuration |
	configuration := self configurationAt: self class dataTypeId.
	(configuration validate: aString)
		ifTrue: [ self at: self class dataTypeId put: aString asString ]
		ifFalse: [ self bioLog: aString , ' is not listed as a valid type for DataType' ]