accessing
sequenceNames
	" Answer a Collection with receiver's sequence headers "
	
	^ self sequences collect: [ : fRec | fRec name ]