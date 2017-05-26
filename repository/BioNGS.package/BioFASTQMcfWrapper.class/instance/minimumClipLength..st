properties
minimumClipLength: aNumber
	" Minimum clip length, overrides scaled auto (1) "

	self propertyAt: 'm' ifAbsentPut: [ aNumber ]