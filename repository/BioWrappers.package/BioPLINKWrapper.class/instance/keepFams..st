properties - filtering
keepFams: aCollection
	" Keep families in aCollection "

	| famIDFile |
	(famIDFile := 'FIDs.txt') asFileReference writeStreamDo: [ : stream |
		aCollection do: [ : famName | 
			stream 
				nextPutAll: famName; 
				nextPutTerminator ] ].
	self propertyAt: 'keep-fam' ifAbsentPut: [ famIDFile ].
