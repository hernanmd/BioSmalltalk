testing
testSequenceCount

	| sampleSeq1 |
	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).
	
	self should: [ project addSequence: sampleSeq1 ] raise: BioDuplicatedObject.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).