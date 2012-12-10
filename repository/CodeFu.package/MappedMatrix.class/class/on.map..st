instance creation
on: aMatrix map: aReindexing 

	[ aMatrix isSquare ] assert.
	^self on: aMatrix rowMap: aReindexing columnMap: aReindexing