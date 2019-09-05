Class {
	#name : #TermsTest,
	#superclass : #TestCase,
	#type : #variable,
	#instVars : [
		'terms'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #running }
TermsTest >> testAddFew [

	terms := Terms fromString: 'and the super of a'.

	self assert: terms size = 5.
	self assert: terms distinctSize = 5.

	^terms
]

{ #category : #running }
TermsTest >> testAddMany [

	terms := Terms fromString: 'and the super of the a of the a'.

	self assert: terms size = 9.
	self assert: terms distinctSize = 5.

	^terms
]

{ #category : #running }
TermsTest >> testCollect [

	| collection |
	terms := Terms sample.

	collection := terms collect: [ :each | each first ].

	self assert: (collection equalsTo: 'aaaaaaaabbbbbcccceefffffgiiiiiiiilllllmmmmmmnppppprrrssssssstttttttttttttttw' asBag).

	^collection
]

{ #category : #running }
TermsTest >> testDistinctSize [

	terms := Terms sample.

	self assert: terms distinctSize = 56.

	^terms
]

{ #category : #running }
TermsTest >> testEmpty [

	terms := Terms new.

	self assert: terms size = 0.
	self assert: terms distinctSize = 0.
	
	terms do: [ :each | self assert: false ]
]

{ #category : #running }
TermsTest >> testEnumerate [

	terms := Terms sample.
	terms do: [ :each | 
		self assert: each isString ]
]

{ #category : #running }
TermsTest >> testEnumerateValues [

	terms := Terms sample.
	terms termsDo: [ :each | 
		self assert: each isString ]
]

{ #category : #running }
TermsTest >> testIncludesFalse [

	terms := Terms sample.

	self assert: (terms includes: 'super') not. 					"not there, but has bucket"
	self assert: (terms includes: '123456789abcdef') not.		"off bounds"
	self assert: (terms includes: '') not.							"off bounds"
	self assert: (terms includes: '123456789') not.				"neither there, nor bucket"
	self assert: (terms includes: nil) not.

	^terms
]

{ #category : #running }
TermsTest >> testIncludesTrue [

	terms := Terms sample.

	self assert: (terms includes: 'tree').
	self assert: (terms includes: 'a').				"first bucket"
	self assert: (terms includes: 'connectivity').	"last bucket"
	self assert: (terms includes: 'the').							
	self assert: (terms includes: 'graph').	

	^terms
]

{ #category : #running }
TermsTest >> testNewColon [

	terms := Terms new: 7.

	self assert: terms size = 0.

	^terms
]

{ #category : #running }
TermsTest >> testOccurrencesOf [

	terms := Terms sample.

	self assert: (terms occurrencesOf: 'tree') = 5.
	self assert: (terms occurrencesOf: 'a') = 6.				
	self assert: (terms occurrencesOf: 'connectivity') = 1.	
	self assert: (terms occurrencesOf: 'the') = 2.							
	self assert: (terms occurrencesOf: 'graph') = 1.	
	^terms
]

{ #category : #running }
TermsTest >> testPrune [

	terms := Terms sample.

	self assert: terms distinctSize = 56.
	self assert: terms size = 76.

	terms prune.

	self assert: terms distinctSize = 3.
	self assert: terms size = 9.

	^terms
]

{ #category : #running }
TermsTest >> testRemoveHapaxes [

	terms := Terms sample.
	self assert: terms distinctSize = 56.
	terms removeHapaxes.
	self assert: terms distinctSize = 12.

	^terms
]

{ #category : #running }
TermsTest >> testRemoveStopwords [

	terms := Terms sample.
	self assert: terms distinctSize = 56.
	terms removeEnglishStopwords.
	self assert: terms distinctSize = 24.

	^terms
]

{ #category : #running }
TermsTest >> testSize [

	terms := Terms sample.

	self assert: terms size = 76.

	^terms
]

{ #category : #running }
TermsTest >> testStellAll [

	terms := Terms sample.

	self assert: terms distinctSize = 56.
	self assert: terms size = 76.

	terms stemAll.

	self assert: terms distinctSize = 55.
	self assert: terms size = 76.

	^terms
]

{ #category : #running }
TermsTest >> testTopTen [

	| charts |
	terms := Terms sample.
	terms removeEnglishStopwords.
	charts := terms topTen.

	self assert: charts size = 10.
	self assert: charts first = 'tree'.
	self assert: charts second = 'paths'.
	self assert: charts third = 'root'.

	^terms
]
