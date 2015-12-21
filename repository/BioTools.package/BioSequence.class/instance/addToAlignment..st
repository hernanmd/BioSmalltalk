accessing
addToAlignment: aBioAlignment
	" Add the receiver to the alignment aBioAlignment "

	^ aBioAlignment
		name: self name;
		addFromSequence: self;
		yourself
	