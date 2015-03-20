accessing
blocksAt: aString
	" Answer a <Collection> of blocks in the receiver for which the name equals aString "
	
	^ self blocks select: [: blk | blk name = aString ]