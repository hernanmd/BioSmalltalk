accessing
addToAlignment: aGTAlignment
	" Add the receiver to the alignment aGTAlignment "

	^ aGTAlignment
		name: self name;
		addFromSequence: self;
		yourself