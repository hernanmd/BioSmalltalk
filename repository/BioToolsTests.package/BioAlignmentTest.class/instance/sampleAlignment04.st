accessing
sampleAlignment04

	align := BioAlignment new.
	align 
		addSequence: 'ACTGCTAGCTAG';
		addSequence: 'ACT-CTAGCTAG';
		addSequence: 'ACTGGTANATGG';
		addSequence: 'ACTGATTGCTGG';
		addSequence: 'ACTGCTTGATTG'.		
	^ align
