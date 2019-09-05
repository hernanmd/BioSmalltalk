Extension { #name : #Collection }

{ #category : #'*BioTools' }
Collection >> bioHasEqualElements: otherCollection [
	"Answer whether the receiver's size is the same as otherCollection's
	size, and each of the receiver's elements equal the corresponding 
	element of otherCollection.
	This should probably replace the current definition of #= ."

	(otherCollection isKindOf: SequenceableCollection) ifFalse: [ ^ false ].
	self size = otherCollection size ifFalse: [ ^ false ].
	self 
		detect: [ : elem | otherCollection includes: elem ]
		ifNone: [ ^ false ].
	^ true
]

{ #category : #'*BioTools' }
Collection >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "
	
	self do: [ : each | each dumpToStream: aStream ]

]

{ #category : #'*BioTools' }
Collection >> groupByEquality [

	| group |
	group := OrderedCollection new.
	self do: [ : item |
		| found |
		found := group 
			detect: [ : c | c includes: item ]
			ifNone: [ nil ].
		found
			ifNil: [ group add: (BioGroupedCollection new add: item; yourself) ]
			ifNotNil: [ found add: item ] ].
	^ group
]

{ #category : #'*BioTools' }
Collection >> includesBeginWith: aString [
	"Answer whether anObject is like one of the receiver's elements."

	^ self anySatisfy: [ :each | 
			each isString 
				ifTrue: [ each asUppercase beginsWith: aString asUppercase ]
				ifFalse: [ each anySatisfy: [ : ss | (ss asUppercase alike: aString asUppercase) > (aString size / 2) asFloat rounded ] ] ]
]

{ #category : #'*BioTools' }
Collection >> includesBeginWithAnyOf: aCollection [
	" Answer whether any element of aCollection is one of the receiver's elements. "
	
	^ aCollection anySatisfy: [ :elem | self includesBeginWith: elem ].

]

{ #category : #'*BioTools' }
Collection >> includesLike: aString [
	"Answer whether anObject is like one of the receiver's elements."

	^ self anySatisfy: [ :each | (each asUppercase alike: aString asUppercase) > (aString size / 2) asFloat rounded ]
]

{ #category : #'*BioTools' }
Collection >> isBioCollection [
	" Answer <true> if receiver is a <Collection> provided by the BioSmalltalk library "

	^ false
]

{ #category : #'*BioTools' }
Collection >> isBioSpecialIdentifier [
	" Answer <true> if receiver is any of the common biological identifiers "

	^ #('pdb' 'bbs' 'gi' 'gnl' 'lcl' 'pat' 'pir' 'prf' 'sp' 'dbj' 'emb' 'gb' 'ref') includes: self
]

{ #category : #'*BioTools' }
Collection >> isBiologicalSequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ (self notEmpty
		and: [ self allSatisfy: #isBiologicalSequence ])
		and: [ self isBioSpecialIdentifier not ]
]

{ #category : #'*BioTools' }
Collection >> isDNASequence [
	" Answer <true> if the receiver represents a identifiable DNA sequence "
	
	^ self allSatisfy: #isDNASequence
]

{ #category : #'*BioTools' }
Collection >> isProteinSequence [
	" Answer <true> if the receiver represents a identifiable Protein sequence "
	
	^ self allSatisfy: #isProteinSequence
]

{ #category : #'*BioTools' }
Collection >> isRNASequence [
	" Answer <true> if the receiver represents a identifiable RNA sequence "
	
	^ self allSatisfy: #isRNASequence
]
