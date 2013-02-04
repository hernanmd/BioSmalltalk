accessing
updateProperty: newSelectedProperty
	" Private - Update the property list if necessary "

	self selectedProperty
		ifNil: [ selectedProperty := newSelectedProperty ]
		ifNotNil: [ 
			self selectedProperty name = newSelectedProperty
				ifFalse: [ selectedProperty := newSelectedProperty ]].