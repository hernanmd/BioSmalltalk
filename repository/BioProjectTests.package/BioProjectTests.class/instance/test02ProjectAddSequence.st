testing
test02ProjectAddSequence

	| sampleSeq1 sampleSeq2 |
	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount = 1.
	self assert: ( project sequences includes: sampleSeq1 ).
	
	sampleSeq2 := self sampleSeq2.
	project addSequence: sampleSeq2.
	self assert: project sequenceCount = 2.
	self assert: ( project sequences includes: sampleSeq2 ).