properties - filtering
removeFam: fileName  
	" Set the family to remove to fileName "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'remove-fam' ifAbsentPut: [ self buildPath: fileName ]