accessing
saveTag: tagNameString value: tagValueString in: aCollection
	" Private - Save tag information in aCollection "
	
	aCollection
		at: tagNameString
		ifPresent: [ : collection | collection add: tagValueString ]
		ifAbsent: [ aCollection at: tagNameString put: (OrderedCollection with: tagValueString) ]
		