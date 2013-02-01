callbacks
selectedProperty: anObject
	" Private - Callback for filter selection "

	| newSelectedProperty |
	
	anObject ifNil: [^self].
	newSelectedProperty := self blastResult blastPropertyAt: anObject asString.
	self updateProperty: newSelectedProperty.
	self explanation: self selectedProperty explanation.
