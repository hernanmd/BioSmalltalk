accessing properties
propertyAt: keyName
	" Answer the property value associated with aKey. "
	
	^ self propertyAt: keyName ifAbsent: [ self error: 'Property not found' ]