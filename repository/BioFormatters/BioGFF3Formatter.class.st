"
The [GFF3 format](https://github.com/The-Sequence-Ontology/Specifications/blob/master/gff3.md) addresses the most common extensions to GFF, while preserving backward compatibility with previous formats.

## Instance Variables

- sequenceFeature:	`BioSequenceFeature`

"
Class {
	#name : #BioGFF3Formatter,
	#superclass : #BioSequenceFeatureFormatter,
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioGFF3Formatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('GFF' 'GFF3')
]

{ #category : #converting }
BioGFF3Formatter >> asString [
	" Answer a <String> representation of the receiver "

	^ String streamContents: [ : outStream |
		outStream 
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
