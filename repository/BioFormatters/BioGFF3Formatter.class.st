"
Specification: https://github.com/The-Sequence-Ontology/Specifications/blob/master/gff3.md

The GFF3 format addresses the most common extensions to GFF, while preserving backward compatibility with previous formats.

    Instance Variables
	sequenceFeature:		<BioSequenceFeature>


    Implementation Points
"
Class {
	#name : #BioGFF3Formatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'sequenceFeature'
	],
	#category : 'BioFormatters-Formatters'
}

{ #category : #'instance creation' }
BioGFF3Formatter class >> fromSequenceFeature: aBioSequenceFeature [
	" Answer a new instance of the receiver using information from aBioSequenceFeature "
	
	^ self new 
		sequenceFeature: aBioSequenceFeature;
		yourself
]

{ #category : #converting }
BioGFF3Formatter >> asString [
	" Answer a <String> representation of the receiver "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self sequenceFeature name; 
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature sourceTag;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature primaryTag;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature start asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature end asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature score asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature strand asString;
			nextPut: self delimiter;
			nextPutAll: self sequenceFeature tag asString ]
]

{ #category : #accessing }
BioGFF3Formatter >> delimiter [
	" Answer a <Character> used to delimit fields between the receiver's elements "
	
	^ Character tab
]

{ #category : #accessing }
BioGFF3Formatter >> sequenceFeature [
	^ sequenceFeature
]

{ #category : #accessing }
BioGFF3Formatter >> sequenceFeature: anObject [
	sequenceFeature := anObject
]
