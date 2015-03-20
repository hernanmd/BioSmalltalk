converting
asAlignment
	" Answer a <BioAlignment> representation of the receiver "
	
	| aln |
	
	aln := BioAlignment new.
	self do: [ : fastaRec | aln addFastaRecord: fastaRec ].
	^ aln
		 