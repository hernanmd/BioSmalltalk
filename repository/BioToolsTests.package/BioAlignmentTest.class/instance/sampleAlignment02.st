accessing
sampleAlignment02

	align := BioAlignment new. " (Gapped(IUPAC.unambiguous_dna, -))."
	align 
		addSequence: ( BioSequence newNamed: 'Alpha' sequence: 'ACTGCTAGCTAG' );
		addSequence: ( BioSequence newNamed: 'Beta' sequence: 'ACT-CTAGCTAG' );
		addSequence: ( BioSequence newNamed: 'Gamma' sequence: 'ACTGCTAGATAG' );
		addSequence: ( BioSequence newNamed: 'Delta' sequence: 'ACTGCTTGCTAG' );
		addSequence: ( BioSequence newNamed: 'Epsilon' sequence: 'ACTGCTTGATAG' ).		
	^ align
