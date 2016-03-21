accessing properties
propertyAt: keyName ifAbsentPut: aBlock
	" Answer the property associated with aKey or, if aKey isn't found store the result of evaluating aBlock as new value. "
	
	^ self 
		propertyAt: keyName 
		ifAbsent: [ self propertyAt: keyName put: aBlock value ]