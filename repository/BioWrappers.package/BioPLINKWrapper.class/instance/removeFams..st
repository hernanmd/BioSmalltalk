properties - filtering
removeFams: aCollection
	" remove families in aCollection "

	| famIDFile |
	(famIDFile := 'FIDs.txt') asFileReference writeStreamDo: [ : stream |
		aCollection do: [ : famName | 
			stream 
				nextPutAll: famName; 
				nextPutTerminator ] ].
	self propertyAt: 'remove-fam' ifAbsentPut: [ famIDFile ].
