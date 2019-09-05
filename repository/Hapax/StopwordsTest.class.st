Class {
	#name : #StopwordsTest,
	#superclass : #TestCase,
	#instVars : [
		'sw'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #running }
StopwordsTest >> testFewWords [

	sw := Stopwords fromString: 'and the super of a'.

	self assert: sw size = 5.

	^sw
]

{ #category : #running }
StopwordsTest >> testIncludesFalse [

	sw := Stopwords fromString: 'and the super of a'.

	self assert: (sw includes: 'A') not.
	self assert: (sw includes: 'offer') not.
	self assert: (sw includes: '') not.
	self assert: (sw includes: 'object') not.
	self assert: (sw includes: nil) not.

	^sw
]

{ #category : #running }
StopwordsTest >> testIncludesTrue [

	sw := Stopwords fromString: 'and the super of a'.

	self assert: (sw includes: 'a').
	self assert: (sw includes: 'of').
	self assert: (sw includes: 'and').
	self assert: (sw includes: 'the').
	self assert: (sw includes: 'super').

	^sw
]
