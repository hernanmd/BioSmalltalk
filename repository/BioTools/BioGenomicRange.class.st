"
Represents a genomic range on a named sequence with strand and metadata. Extends BioObject with IRanges-compatible range operations. Instance Variables: seqname <String> Sequence name. irange <BioIRanges> The interval range. strand <BioStrand> Strand orientation. metadata <Dictionary> Additional metadata.
"
Class {
	#name : 'BioGenomicRange',
	#superclass : 'BioObject',
	#instVars : [
		'seqname',
		'irange',
		'strand',
		'metadata'
	],
	#category : 'BioTools-Genomic-Ranges',
	#package : 'BioTools',
	#tag : 'Genomic-Ranges'
}

{ #category : 'as yet unclassified' }
BioGenomicRange class >> seqname: aSeqname start: aStart end: anEnd strand: aStrand [
	^ self new
		seqname: aSeqname;
		irange: (BioIRanges starts: { aStart } ends: { anEnd });
		strand: (BioStrand from: aStrand);
		metadata: Dictionary new;
		yourself
]

{ #category : 'accessing' }
BioGenomicRange >> end [
	^ irange endAt: 1
]

{ #category : 'accessing' }
BioGenomicRange >> irange [

	^ irange
]

{ #category : 'accessing' }
BioGenomicRange >> irange: anObject [

	irange := anObject
]

{ #category : 'accessing' }
BioGenomicRange >> metadata [
	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioGenomicRange >> metadata: anObject [

	metadata := anObject
]

{ #category : 'testing' }
BioGenomicRange >> overlaps: anotherGenomicRange ignoreStrand: aBoolean [

	seqname asString ~= anotherGenomicRange seqname asString ifTrue: [
		^ false ].
	(aBoolean not and: [
			 self strand symbol ~= #* and: [
					 anotherGenomicRange strand symbol ~= #* and: [
						 self strand symbol ~= anotherGenomicRange strand symbol ] ] ])
		ifTrue: [ ^ false ].
	^ self start <= anotherGenomicRange end and: [
		  anotherGenomicRange start <= self end ]
]

{ #category : 'printing' }
BioGenomicRange >> printOn: aStream [

	aStream
		nextPutAll: seqname asString;
		nextPutAll: ':';
		nextPutAll: self start asString;
		nextPutAll: '-';
		nextPutAll: self end asString;
		nextPutAll: '(';
		nextPutAll: self strand symbol asString;
		nextPutAll: ')'
]

{ #category : 'accessing' }
BioGenomicRange >> seqname [

	^ seqname
]

{ #category : 'accessing' }
BioGenomicRange >> seqname: anObject [

	seqname := anObject
]

{ #category : 'accessing' }
BioGenomicRange >> start [
	^ irange startAt: 1
]

{ #category : 'accessing' }
BioGenomicRange >> strand [
	^ strand ifNil: [ BioStrand unknown ]
]

{ #category : 'accessing' }
BioGenomicRange >> strand: anObject [

	strand := anObject
]

{ #category : 'accessing' }
BioGenomicRange >> width [
	^ irange widthAt: 1
]
