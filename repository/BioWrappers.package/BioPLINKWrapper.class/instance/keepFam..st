properties - filtering
keepFam: fileName  
	" Set the family to keep to fileName "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'keep-fam' ifAbsentPut: [ fileName ]