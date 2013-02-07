callbacks
selectedProperty: aMQBProperty
	" Private - Callback for property selection "

	aMQBProperty ifNil: [^self].
	self updateOperators: aMQBProperty.
	self updateProperty: aMQBProperty.
	self explanation: self selectedProperty explanation.
