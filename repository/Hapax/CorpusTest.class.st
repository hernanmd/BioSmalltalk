Class {
	#name : #CorpusTest,
	#superclass : #TestCase,
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #running }
CorpusTest >> testDeer90 [

	| deer |
	deer := Corpus deer90.
	
	self assert: deer documents size = 9.
	self assert: deer terms distinctSize = 42.

	^deer
]

{ #category : #running }
CorpusTest >> testRemoveStopwords [

	| deer |
	deer := self testDeer90.

	self assert: (deer terms includes: 'the').

	deer removeStopwords.

	self assert: (deer terms includes: 'the') not.
	self assert: deer documents size = 9.
	self assert: deer terms distinctSize = 34.

	^deer
]

{ #category : #running }
CorpusTest >> testStemDeer90 [

	| deer |
	deer := self testDeer90.

	self assert: (deer terms includes: 'trees').
	self assert: (deer terms includes: 'tree') not.

	deer stemAll.

	self assert: (deer terms includes: 'trees') not.
	self assert: (deer terms includes: 'tree').

	self assert: deer documents size = 9.
	self assert: deer terms distinctSize = 42.

	^deer
]
