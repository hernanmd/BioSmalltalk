testing
testAddSequence

	| sampleSeq1 sampleSeq2 |
	
	BioProject resetApplication.
	project := (BioUser named: 'TestUser1') addProject: 'testProject1'.	
	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).
	
	sampleSeq2 := self sampleSeq2.
	project addSequence: sampleSeq2.
	self assert: project sequenceCount equals: 2.
	self assert: (project sequences includes: sampleSeq2).