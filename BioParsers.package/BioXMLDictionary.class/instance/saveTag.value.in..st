accessing
saveTag: tagNameString value: tagValueString in: aCollection
	" Private - Save tag information in aCollection "
	
	aCollection
		at: tagNameString
		put: tagValueString