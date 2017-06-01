accessing
taxaBlocks
	" Answer a <Collection> of taxa blocks in the receiver "
	
	^ self blocks select: #isNexusTaxaBlock