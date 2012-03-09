*BioTools
addToAlignment: aBioAlignment
	" Private - Add the receiver to aBioAlignment "

	aBioAlignment addSequence: ( BioSequence newWith: self )