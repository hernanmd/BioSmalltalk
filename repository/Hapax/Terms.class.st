Class {
	#name : #Terms,
	#superclass : #Bag,
	#classVars : [
		'Void'
	],
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #examples }
Terms class >> bible [

	^TermScanner new onFile: 'bible10.txt'; allTerms
]

{ #category : #'instance creation' }
Terms class >> fromCamelcaseString: aString [

	^((CamelcaseScanner new onString: aString) allTerms) stemAll; removeEnglishStopwords
]

{ #category : #'instance creation' }
Terms class >> fromFile: aFile [

	^TermScanner new onFile: aFile; allTerms
]

{ #category : #'instance creation' }
Terms class >> fromString: aString [

	^TermScanner new onString: aString; allTerms
]

{ #category : #initialize }
Terms class >> initialize [
	super initialize.
	Void := Object new.
]

{ #category : #examples }
Terms class >> sample [

	^self fromString:
		'I think that I shall never see
		a graph more lovely than a tree.
		A tree whose crucial property
		is loop-free connectivity.
		A tree that must be sure to span
		so packet can reach every LAN.
		First, the root must be selected.
		By ID, it is elected.
		Least-cost paths from root are traced.
		In the tree, these paths are placed.
		A mesh is made by folks like me,
		then bridges find a spanning tree.'
]

{ #category : #examples }
Terms class >> termCloud [

	^self bible prune showTermCloud
]

{ #category : #accessing }
Terms class >> void [
	^ Void
]

{ #category : #adding }
Terms >> addString: string [

	^self addString: string using: TermScanner
]

{ #category : #adding }
Terms >> addString: string using: scannerClass [

	| scanner |
	scanner := scannerClass new.
	scanner onString: string.
	[ scanner atEnd ] whileFalse: [ self add: scanner next ].
]

{ #category : #hack }
Terms >> asArray [
	^ super asArray reversed
]

{ #category : #accessing }
Terms >> distinctSize [

	^contents associations size
]

{ #category : #removing }
Terms >> prune [

	self removeEnglishStopwords.
	self removeHapaxes.
	self stemAll.
]

{ #category : #removing }
Terms >> removeEnglishStopwords [

	^self removeStopwords: Stopwords english
]

{ #category : #removing }
Terms >> removeHapaxes [

	self removeRareTerms: 1.
]

{ #category : #removing }
Terms >> removeRareTerms: occurrence [

	| newTerms |
	newTerms := Terms new: contents capacity.
	self withCountDo: [ :term :count |
		count > occurrence ifTrue: [
			newTerms add: term stem withOccurrences: count ]].
	self become: newTerms
]

{ #category : #removing }
Terms >> removeSpanishStopwords [

	^self removeStopwords: Stopwords spanish
]

{ #category : #removing }
Terms >> removeStopwords: stopwords [

	stopwords do: [ :each |
		
		contents removeKey: each ifAbsent: nil]
]

{ #category : #removing }
Terms >> stemAll [

	| newTerms |
	newTerms := Terms new: contents capacity.
	self withCountDo: [ :term :count |
		newTerms add: term stem withOccurrences: count ].
	self become: newTerms
]

{ #category : #enumerating }
Terms >> termsDo: aBlock [

	contents associationsDo: [ :each | 
		aBlock value: each key ] "!!! value -> count !!!"
]

{ #category : #converting }
Terms >> top: topTenSize [

	^(self sortedCounts first: topTenSize) collect: #key
]

{ #category : #converting }
Terms >> topTen [

	^(self sortedCounts first: 10) collect: #value
]

{ #category : #enumerating }
Terms >> withCountDo: aBlock [

	contents associationsDo: [ :each |
		aBlock value: each key value: each value ]
]
