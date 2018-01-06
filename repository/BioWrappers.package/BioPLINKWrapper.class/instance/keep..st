properties - filtering
keep: fileName  
	" Accepts a space/tab-delimited fileName text file with family IDs in the first column and within-family IDs in the second column, and removes all unlisted samples from the current analysis "

	fileName asFileReference exists 
		ifFalse: [ fileName asFileReference writeStreamDo: [ : stream | stream nextPutAll: fileName ] ].
	self propertyAt: 'keep' ifAbsentPut: [ self buildPath: fileName ]