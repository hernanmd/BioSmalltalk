accessing
asAlignment
	" Answer a <BioAlignment> object with receiver's contents "
	
	| align |
	
	align := BioAlignment new.
	self sequences do: [ : seq | align addSequence: seq ].
	^ align