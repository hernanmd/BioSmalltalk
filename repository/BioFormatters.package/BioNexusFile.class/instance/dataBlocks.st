accessing
dataBlocks
	" Answer a <Collection> of data blocks in the receiver "
	
	^ self blocks select: #isNexusDataBlock