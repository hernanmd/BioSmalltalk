properties
propertyAt: keyName ifAbsentPut: aBlock
	" See superimplementor's comment "

	keyName size = 1
		ifTrue: [ self propertySeparator: Character space ].
	super propertyAt: keyName ifAbsentPut: aBlock
