accessing properties
removeProperty: keyName
	" Remove the property with aKey. Answer the property or raise an error if aKey isn't found. "
	
	^ self 
		removeProperty: keyName 
		ifAbsent: [ self error: 'Property not found' ]