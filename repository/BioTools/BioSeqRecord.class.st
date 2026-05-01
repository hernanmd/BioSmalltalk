"
BioSeqRecord stores a sequence with additional information, this is usually called sequence with annotations.


"
Class {
	#name : 'BioSeqRecord',
	#superclass : 'BioNamedObject',
	#instVars : [
		'seq',
		'header',
		'annotations',
		'description',
		'letterAnnotations',
		'dbxRefs',
		'sequenceFeatures',
		'annotationsClass',
		'sequenceFeaturesClass'
	],
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'instance creation' }
BioSeqRecord class >> new: aBioSequence [
	" Answer a new instance of the receiver setting aBioSequence "
	
	^ self new initializeWith: aBioSequence
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> , aBioSeqRecord [
	" Concatenate the receiver's sequences with aBioSeqRecord if their sequences are compatible. Answer the receiver "
	
	self sequence: self sequence , aBioSeqRecord sequence
]

{ #category : 'comparing' }
BioSeqRecord >> = anObject [
	" Answer whether the receiver and anObject represent the same object. "

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	(self sequence = anObject sequence and: [ self id = anObject id ])
		ifFalse: [ ^ false ].
	^ true
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> addSeqFeature: aBioSequenceFeature [
	" Attach aBioSequenceFeature to the receiver "
	
	self sequenceFeatures add: aBioSequenceFeature.
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotations [
	" Answer a <Collection> with receiver's annotations "

	^ annotations
		ifNil: [ annotations := self annotationsClass new ]
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotations: anObject [
	annotations := anObject
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotationsAt: aKey [
	" Get annotations at aKey in the receiver's annotations "

	^ self annotations at: aKey
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotationsAt: aKey ifAbsent: absentBlock [
	" Get annotations at aKey in the receiver's annotations "

	^ self annotations at: aKey ifAbsent: absentBlock
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotationsAt: aKey ifAbsentPut: absentBlock [
	" Get annotations at aKey in the receiver's annotations "

	^ self annotations
		  at: aKey
		  ifAbsent: [ self annotationsAt: aKey put: absentBlock value ]
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotationsAt: aKey put: aValue [
	" Set aValue annotation at aKey in the receiver's annotations "

	^ self annotations at: aKey put: aValue
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> annotationsClass [
	" Answer a <Collection> class used to store the receiver's annotations "
	
	^ annotationsClass
		ifNil: [ annotationsClass := self defaultAnnotationsClass ]
]

{ #category : 'accessing' }
BioSeqRecord >> annotationsClass: anObject [
	^ annotationsClass := anObject
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> copySeqFrom: startInteger [
	" See comment in BioSequence. Answer the receiver "
	
	self sequence: (self sequence copyFrom: startInteger)
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> copySeqTo: stopInteger [
	" See comment in BioSequence. Answer the receiver "
	
	self sequence: (self sequence copyTo: stopInteger)
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> dates [
	"Answer a Collection of dates associated with the record"
	^ self annotationsAt: #dates ifAbsent: [ OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> dates: aCollection [
	"Set the dates associated with the record"
	self annotationsAt: #dates put: aCollection
]

{ #category : 'accessing' }
BioSeqRecord >> dbxRefs [
	^ dbxRefs
]

{ #category : 'accessing' }
BioSeqRecord >> dbxRefs: anObject [
	dbxRefs := anObject
]

{ #category : 'defaults' }
BioSeqRecord >> defaultAnnotationsClass [
	" Answer the default <Collection> class used to store the receiver's annotations "

	^ Dictionary
]

{ #category : 'defaults' }
BioSeqRecord >> defaultSequenceFeaturesClass [
	" Answer the default <Class> used to store the receiver's sequence features "
	
	^ OrderedCollection
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> definition [
	"Answer the sequence definition (same as description)"
	^ self description
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> definition: aString [
	"Set the sequence definition (same as description:)"
	self description: aString
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> description [
	^ description
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> description: anObject [
	description := anObject
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> division [
	"Answer the GenBank division code (e.g., PRI, PLN, VRT)"
	^ self annotationsAt: #division ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> division: aString [
	"Set the GenBank division code"
	self annotationsAt: #division put: aString
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> featureCount [
	"Answer the number of sequence features"
	^ self sequenceFeatures size
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> features [
	" See comment in sequenceFeatures "

	^ self sequenceFeatures
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> features: anObject [
	sequenceFeatures := anObject
]

{ #category : 'comparing' }
BioSeqRecord >> hash [
	" Private - hash is implemented because #= is implemented "
	
	^ self sequence hash bitXor: self id hash
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> header [
	" Answer a <String> with receiver's information "
	
	^ header
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> header: aString [
	" Set the receiver's basic description information to aString"
	
	header := aString
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> id [
	" Answer the receiver's identifier "

	^ self name
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> id: aString [
	" Set the receiver's identifier to be anObject "

	self name: aString
]

{ #category : 'initialize-release' }
BioSeqRecord >> initializeWith: aBioSequence [
	" Private - Initialize the receiver's sequence "
	
	seq := aBioSequence
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> keywords [
	"Answer a Collection of keywords for the record"
	^ self annotationsAt: #keywords ifAbsent: [ OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> keywords: aCollection [
	"Set the keywords for the record"
	self annotationsAt: #keywords put: aCollection
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> letterAnnotations [
	" Answer a <Dictionary> with per-letter annotations. "

	^ letterAnnotations
		ifNil: [ letterAnnotations := (self letterAnnotationsClass new: self sequence size) yourself ]
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> letterAnnotations: aDictionary [
	" Set the receiver's per-letter annotations to be aDictionary "

	letterAnnotations := aDictionary
	
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> letterAnnotationsAt: aKey [
	" Answer the receiver's per-letter annotation for the sequence at aKey "
	
	^ self letterAnnotations at: aKey
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> letterAnnotationsAt: aKey put: aCollection [
	" At aKey add aCollection to the receiver's per-letter annotation for the sequence. aCollection must match the length of the receiver's sequence length "
	
	aCollection size = self sequence size
		ifTrue: [ ^ self letterAnnotations at: aKey put: aCollection ]
		ifFalse: [ self signalInvalidObject: 'Unmatched letter annotations length and sequence length' translated ].
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> letterAnnotationsClass [

	^ Dictionary
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> organism [
	"Answer the organism name"
	^ self annotationsAt: #organism ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> organism: aString [
	"Set the organism name"
	self annotationsAt: #organism put: aString
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> primaryAccession [
	"Answer the primary accession number. Defaults to id if not set."
	^ self annotationsAt: #primaryAccession ifAbsent: [ self id ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> primaryAccession: aString [
	"Set the primary accession number"
	self annotationsAt: #primaryAccession put: aString
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> primaryAccessionDefaultsToId: aBoolean [
	"Set whether primary accession should default to id"
	self annotationsAt: #primaryAccessionDefaultsToId put: aBoolean
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> removeAnnotations [
	" Completely remove all the annotations from the receiver "

	self annotations: self annotationsClass new
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> removeAnnotationsAt: key [
	" Remove key from the receiver. If key is not in the receiver, notify an error."

	^ self annotations removeKey: key
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> removeLetterAnnotations [
	" Completely remove all the letter annotations from the receiver "

	self letterAnnotations: self letterAnnotationsClass new
]

{ #category : 'accessing - sequence annotations' }
BioSeqRecord >> removeLetterAnnotationsAt: key [
	" Remove key from the receiver. If key is not in the receiver, notify an error. "

	^ self letterAnnotations removeKey: key
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> removeSeqFeature: aBioSequenceFeature [
	" Remove aBioSequenceFeature from the receiver "
	
	self sequenceFeatures remove: aBioSequenceFeature
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> secondaryAccessions [
	"Answer a Collection of secondary accession numbers"
	^ self annotationsAt: #secondaryAccessions ifAbsent: [ OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> secondaryAccessions: aCollection [
	"Set the secondary accession numbers"
	self annotationsAt: #secondaryAccessions put: aCollection
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> seqVersion [
	"Answer the sequence version number"
	^ self annotationsAt: #seqVersion ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> seqVersion: anInteger [
	"Set the sequence version number"
	self annotationsAt: #seqVersion put: anInteger
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> sequence [
	" Answer the receiver's <BioSequence>. "

	^ seq
]

{ #category : 'accessing-sequence' }
BioSeqRecord >> sequence: aBioSequence [
	" Set the receiver's sequence to be aBioSequence "

	seq := aBioSequence
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> sequenceFeatures [
	" Answer the receiver's sequence features object "

	^ sequenceFeatures
		ifNil: [ sequenceFeatures := self sequenceFeaturesClass new ]
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> sequenceFeatures: aCollection [
	" Set the receiver's sequence feature to be aCollection "

	sequenceFeatures := aCollection
]

{ #category : 'accessing - sequence features' }
BioSeqRecord >> sequenceFeaturesClass [
	" Private - Answer the <Class> used to store sequence features "
	
	^ sequenceFeaturesClass
		ifNil: [ sequenceFeaturesClass := self defaultSequenceFeaturesClass ] 
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> species [
	"Answer the species name"
	^ self annotationsAt: #species ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> species: aString [
	"Set the species name"
	self annotationsAt: #species put: aString
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> speciesName [
	"Answer the species name (alias for species or organism)"
	^ self species ifNotNil: [ :s | s ] ifNil: [ self organism ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> speciesName: aString [
	"Set the species name"
	self species: aString
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> taxonomy [
	"Answer a Collection of taxonomy entries"
	^ self annotationsAt: #taxonomy ifAbsent: [ OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
BioSeqRecord >> taxonomy: aCollection [
	"Set the taxonomy entries"
	self annotationsAt: #taxonomy put: aCollection
]
