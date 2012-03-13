testing
test04ProjectRemoveSequence

	| sampleSeq1 sampleSeq2 |
	self assert: project sequences isEmpty.
	
	sampleSeq1 := self sampleSeq1.
	sampleSeq2 := self sampleSeq2.	
	project addSequence: sampleSeq1.
	project addSequence: sampleSeq2.
		
	project removeSequence: sampleSeq1.
	self deny: project sequences isEmpty.
	self assert: project sequenceCount = 1.
	self should: [ project removeSequence: sampleSeq1 ] raise: BioNotFoundObject.
	
	project removeSequence: sampleSeq2.
	self assert: project sequences isEmpty.
	self should: [ project removeSequence: sampleSeq2 ] raise: BioNotFoundObject.