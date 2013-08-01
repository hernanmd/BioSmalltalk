private
updateProperty: aValue

	self propertyName1 isNil
		ifTrue: [ self propertyName1: aValue ]
		ifFalse: [ self propertyName2: aValue name.
			self updateDisplayName. ]