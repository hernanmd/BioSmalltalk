"
A sequence feature supports information with a sequence location. This class is Generic Feature Format (GFF) based.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	end:			<Object>
	frame:		<Object>
	location:		<Object>
	primaryTag:	<Object>
	score:		<Object>
	sequence:	<Object>
	sourceTag:	<Object>
	start:		<Object>
	strand:		<Object>


    Implementation Points
"
Class {
	#name : #BioSequenceFeature,
	#superclass : #BioChromosomeFragment,
	#instVars : [
		'sequence',
		'strand',
		'location',
		'score',
		'frame',
		'primaryTag',
		'sourceTag',
		'tags',
		'chromosome'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #examples }
BioSequenceFeature class >> example01 [
	" Based in BioPerl example : http://lab.stajich.org/presentations/stajich_2006_Bioperl_I.pdf "

	^ self new
		start: 10;
		end: 20;
		strand: 1;
		name: 'hs.1';
		primaryTag: 'CDS';
		sourceTag: 'genscan';
		score: 30;
		addTag: 'Parent' -> 'Gene1';
		yourself
]

{ #category : #examples }
BioSequenceFeature class >> fromCoordinateStart: startCoordinate end: endCoordinate [

	^ self new
		start: startCoordinate;
		end: endCoordinate;
		yourself
]

{ #category : #comparing }
BioSequenceFeature >> = aBioSequenceFeature [
	"Answer <true> if the receiver is equal to aBioSequenceFeature"
	
	self chromosome = aBioSequenceFeature chromosome
		ifFalse: [ ^ false ].
	self strand = aBioSequenceFeature strand
		ifFalse: [ ^ false ].
	^ super = aBioSequenceFeature

]

{ #category : #'accessing - tags' }
BioSequenceFeature >> addTag: anAssociation [
	" Add a tag value pair in anAssociation to the receiver's tags "

	self tags at: anAssociation key put: anAssociation value
]

{ #category : #accessing }
BioSequenceFeature >> chromosome [

	^ chromosome
]

{ #category : #accessing }
BioSequenceFeature >> chromosome: anObject [

	chromosome := anObject
]

{ #category : #accessing }
BioSequenceFeature >> frame [
	^ frame
]

{ #category : #accessing }
BioSequenceFeature >> frame: anObject [
	frame := anObject
]

{ #category : #testing }
BioSequenceFeature >> hasTagNamed: aString [
	" Answer <true> if aString exists as a tag in the receiver "
	

]

{ #category : #comparing }
BioSequenceFeature >> hash [
	" Private - hash is implemented because #= is implemented "
	
	^ self chromosome bitXor: (self strand bitXor: super hash)

]

{ #category : #'accessing - tags' }
BioSequenceFeature >> includesTag: tagName [
	" Answer <true> if tag with tagName String is present in the receiver's tags "
	
	^ self tags includesKey: tagName
]

{ #category : #accessing }
BioSequenceFeature >> location [
	^ location
]

{ #category : #accessing }
BioSequenceFeature >> location: anObject [
	location := anObject
]

{ #category : #testing }
BioSequenceFeature >> overlaps: aBioSequenceFeature [
	"Answer <true> if the receiver start and end regions overlaps aBioSequenceFeature regions"
	
	self = aBioSequenceFeature 
		ifTrue: [ ^ true ].
	self chromosome ~= aBioSequenceFeature chromosome
		ifTrue: [ ^ false ].
	"
		self =                  |-| 
		aBioSequenceFeature =  |---|
	"
	(self start >= aBioSequenceFeature start and: [ self end <= aBioSequenceFeature end ])
		ifTrue: [ ^ true ].
	"
		self =                 |---| 
		aBioSequenceFeature =   |-|
	"
	(aBioSequenceFeature start >= self start and: [ aBioSequenceFeature end <= self end ])
		ifTrue: [ ^ true ].
	"
		self =                   |---|
		aBioSequenceFeature =  |---|
	"
	(self start >= aBioSequenceFeature start and: [ self start < aBioSequenceFeature end ])
		ifTrue: [ ^ true ].
	"
		self =                |---|
		aBioSequenceFeature =   |---|
	"
	(self start < aBioSequenceFeature start and: [ self end > aBioSequenceFeature start ])
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> primaryTag [
	^ primaryTag
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> primaryTag: anObject [
	primaryTag := anObject
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> removeTag: tagName [
	" Remove tagName from the receiver's tags "

	self tags removeKey: tagName
]

{ #category : #accessing }
BioSequenceFeature >> score [
	" Answer a <Number> representing the receiver's score "

	^ score
]

{ #category : #accessing }
BioSequenceFeature >> score: aNumber [
	" Set the receiver's score to aNumber "

	score := aNumber
]

{ #category : #accessing }
BioSequenceFeature >> sequence [
	^ sequence
]

{ #category : #accessing }
BioSequenceFeature >> sequence: anObject [
	sequence := anObject
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> sourceTag [
	^ sourceTag
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> sourceTag: anObject [
	sourceTag := anObject
]

{ #category : #accessing }
BioSequenceFeature >> strand [
	^ strand
]

{ #category : #accessing }
BioSequenceFeature >> strand: anObject [
	strand := anObject
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> tagCollectionClass [
	" Answer a <Class> for storing the receiver's tags "

	^ Dictionary 
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> tags [
	" Answer a <Collection> with the receiver's tags "

	^ tags
		ifNil: [ tags := self tagCollectionClass new ]
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> tags: anObject [
	tags := anObject
]
