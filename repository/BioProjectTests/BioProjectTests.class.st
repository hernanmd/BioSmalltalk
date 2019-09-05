Class {
	#name : #BioProjectTests,
	#superclass : #TestCase,
	#instVars : [
		'project'
	],
	#category : 'BioProjectTests-Core'
}

{ #category : #accessing }
BioProjectTests >> newSampleSeq: aString [

	^ BioSequence newWith: aString alphabet: BioIUPACAmbiguousDNA

]

{ #category : #accessing }
BioProjectTests >> newSampleSeqRecord: aString [

	^ BioSeqRecord new
		seq: (BioSequence newWith: aString alphabet: BioIUPACAmbiguousDNA)

]

{ #category : #accessing }
BioProjectTests >> sampleSeq1 [

	^ self newSampleSeq: 'acatgtgacatgcatgcatgcaca'

]

{ #category : #accessing }
BioProjectTests >> sampleSeq2 [

	^ self newSampleSeq: 'acgtgatgcgtagcattacgagcatcgac'
]

{ #category : #running }
BioProjectTests >> setUp [

	BioProject resetApplication.
	PFProjectApplication applicationClass: BioPFTestApp.
	project := (BioUser named: 'TestUser1') addProject: 'testProject1'.

]

{ #category : #testing }
BioProjectTests >> testAddSequence [

	| sampleSeq1 sampleSeq2 |

	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).
	
	sampleSeq2 := self sampleSeq2.
	project addSequence: sampleSeq2.
	self assert: project sequenceCount equals: 2.
	self assert: (project sequences includes: sampleSeq2).
]

{ #category : #testing }
BioProjectTests >> testJobs [

	self assert: (project isKindOf: BioProject).
	self assert: (project info isKindOf: PFProjectInformation).
	self assert: (project jobs isKindOf: Collection).
	
	self assert: project jobs isEmpty.
	self assert: project jobsCount equals: 0.
	self assert: project isProject.
	self assert: (project name isKindOf: String).
	
]

{ #category : #testing }
BioProjectTests >> testRemoveSequence [

	| sampleSeq1 sampleSeq2 |
	self assert: project sequences isEmpty.
	
	sampleSeq1 := self sampleSeq1.
	sampleSeq2 := self sampleSeq2.	
	project addSequence: sampleSeq1.
	project addSequence: sampleSeq2.
		
	project removeSequence: sampleSeq1.
	self deny: project sequences isEmpty.
	self assert: project sequenceCount equals: 1.
	self should: [ project removeSequence: sampleSeq1 ] raise: BioNotFoundObject.
	
	project removeSequence: sampleSeq2.
	self assert: project sequences isEmpty.
	self should: [ project removeSequence: sampleSeq2 ] raise: BioNotFoundObject.
]

{ #category : #testing }
BioProjectTests >> testSequenceCount [

	| sampleSeq1 |
	self assert: project sequences isEmpty.

	sampleSeq1 := self sampleSeq1.
	project addSequence: sampleSeq1.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).
	
	self should: [ project addSequence: sampleSeq1 ] raise: BioDuplicatedObject.
	self assert: project sequenceCount equals: 1.
	self assert: (project sequences includes: sampleSeq1).
]

{ #category : #testing }
BioProjectTests >> testSequences [

	self assert: (project sequences isKindOf: Collection).
	self assert: (project sequenceCount isKindOf: Number)
]
