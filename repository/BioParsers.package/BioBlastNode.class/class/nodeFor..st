accessing
nodeFor: aString
	" Answer a new instances of a subclass corresponding to aString "
	
	| found |
	
	^ ( found := self allContentSubclasses 
		detect: [ : cls | cls nodeNames includes: aString ]
		ifNone: [ nil ] ) isNil
			ifFalse: [ found new nodeName: aString ]
			ifTrue: [ nil "self error: 'Cannot find class for ' , aString asString" ]