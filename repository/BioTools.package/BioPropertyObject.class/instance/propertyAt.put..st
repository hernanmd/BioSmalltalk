accessing properties
propertyAt: keyName put: anObject
	" Set the property at aKey to be anObject. If aKey is not found, create a new entry for aKey and set is value to anObject. Answer anObject. "

	^ (properties ifNil: [ properties := Dictionary new: 1 ])
		at: keyName put: anObject