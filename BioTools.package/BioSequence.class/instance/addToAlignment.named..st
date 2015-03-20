accessing
addToAlignment: aBioAlignment named: seqName
	" Add the receiver to the alignment aBioAlignment "

	self name: seqName.
	^ aBioAlignment
		addFromSequence: self;
		yourself