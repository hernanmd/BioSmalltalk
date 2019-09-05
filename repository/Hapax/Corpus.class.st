Class {
	#name : #Corpus,
	#superclass : #Object,
	#instVars : [
		'documents'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #example }
Corpus class >> deer90 [
	"(((	self deer90	)))"

	| data corpus |
	data := #(	( c1 'Human machine interface for Lab ABC computer applications' )
		( c2 'A survey of user opinion of computer system response time' )
		( c3 'The EPS user interface management system' )
		( c4 'System and human system engineering testing of EPS' )
		( c5 'Relation of user-perceived response time to error measurement' )
		( m1 'The generation of random, binary, unordered trees' )
		( m2 'The intersection graph of paths in trees' )
		( m3 'Graph minors IV: Widths of trees and well-quasi-ordering' )
		( m4 'Graph minors: A survey' ) ).
	corpus := Corpus new.
	data do: [ :each |
		corpus addDocument: each first with: (Terms fromString: each last) ].
	^corpus
]

{ #category : #'instance creation' }
Corpus class >> new [

	^self basicNew initialize
]

{ #category : #adding }
Corpus >> addDocument: anObject [

	documents at: anObject ifAbsentPut: [ Terms new ]
]

{ #category : #adding }
Corpus >> addDocument: anObject with: terms [

	self addDocument: anObject.
	self atDocument: anObject add: terms.
]

{ #category : #adding }
Corpus >> addFile: aFilename [

	self addDocument: aFilename asString with: (Terms new 
		addString: aFilename contentsOfEntireFile using: CamelcaseScanner; yourself)
]

{ #category : #adding }
Corpus >> addFolder: aFoldername [

	aFoldername asFilename filesDo: [ :each |
		self addFile: each ]
]

{ #category : #adding }
Corpus >> atDocument: anObject add: terms [

	(documents at: anObject) addAll: terms
]

{ #category : #enumerating }
Corpus >> documentTermCountDo: aBlock [

	documents keysAndValuesDo: [ :document :terms |
		terms withCountDo: [ :term :count |
			aBlock 
				value: document 
				value: term
				value: count ]]
]

{ #category : #accessing }
Corpus >> documents [

	^documents keys
]

{ #category : #'initialize-release' }
Corpus >> initialize [

	documents := Dictionary new.
]

{ #category : #removing }
Corpus >> removeStopwords [

	self subclassResponsibility
]

{ #category : #removing }
Corpus >> stemAll [

	documents do: [ :each |
		each stemAll ]
]

{ #category : #accessing }
Corpus >> terms [

	| all |
	all := Terms new.
	documents do: [ :each |
		all addAll: each ].
	^all
]
