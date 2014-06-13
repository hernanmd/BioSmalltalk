accessing
addFastaRecord: fastaRecord
	" Add anObject to the alignment "
	
	^ self addSequence: fastaRecord sequence named: fastaRecord sequenceName