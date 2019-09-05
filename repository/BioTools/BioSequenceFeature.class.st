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
	#superclass : #BioObject,
	#instVars : [
		'sequence',
		'start',
		'end',
		'strand',
		'location',
		'score',
		'frame',
		'primaryTag',
		'sourceTag',
		'tags'
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
		tag: ('Parent' -> 'Gene1');
		yourself
]

{ #category : #'accessing - tags' }
BioSequenceFeature >> addTag: anAssociation [
	" Add a tag value pair in anAssociation to the receiver's tags "

	self tags at: anAssociation key put: anAssociation value
]

{ #category : #accessing }
BioSequenceFeature >> end [
	^ end
]

{ #category : #accessing }
BioSequenceFeature >> end: anObject [
	end := anObject
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
BioSequenceFeature >> start [
	^ start
]

{ #category : #accessing }
BioSequenceFeature >> start: anObject [
	start := anObject
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
