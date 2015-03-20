accessing
sampleAlignment03

	align := BioAlignment new.
	align 
		addSequence: 'ACTGCTAGCTAG';
		addSequence: 'ACT-CTAGCTAG';
		addSequence: 'ACTGCTAGATAG';
		addSequence: 'ACTGCTTGCTAG';
		addSequence: 'ACTGCTTGATAG'.		
	^ align
