callbacks
selectedProperty: anObject
	" Private - Callback for property selection "

	| newSelectedProperty |
	
	anObject ifNil: [^self].
	newSelectedProperty := self blastResult blastPropertyAt: anObject asString.
	self updateOperators: newSelectedProperty for: anObject asString.
	self updateProperty: newSelectedProperty.
	self explanation: self selectedProperty explanation.
