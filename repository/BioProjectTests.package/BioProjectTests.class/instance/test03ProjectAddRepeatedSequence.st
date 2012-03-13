testing
test03ProjectAddRepeatedSequence

	| sampleSeq1 |
	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount = 1.
	self assert: ( project sequences includes: sampleSeq1 ).
	
	self should: [ project addSequence: sampleSeq1 ] raise: BioDuplicateObject.
	self assert: project sequenceCount = 1.
	self assert: ( project sequences includes: sampleSeq1 ).