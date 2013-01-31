accessing
searchIndexSelector: anObject
	" Private - Callback for filter selection "

	| newSelectedProperty |
	
	anObject ifNil: [^self].
	newSelectedProperty := self blastResult blastPropertyAt: anObject.
	self selectedProperty
		ifNil: [ self selectedProperty: newSelectedProperty ]
		ifNotNil: [ 
			self selectedProperty name = newSelectedProperty
				ifFalse: [ self selectedProperty: newSelectedProperty ]].
	self explanation: self selectedProperty explanation.
