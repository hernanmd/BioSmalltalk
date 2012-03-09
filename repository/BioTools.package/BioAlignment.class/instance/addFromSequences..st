accessing
addFromSequences: aSequenceCollection
	" Add aSequenceCollection to the receiver's alignments "
	
	aSequenceCollection do: [: seq |
		self addSequence: seq asSequence ]
