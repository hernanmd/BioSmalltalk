"
A genomic interval representing a half-open region on a chromosome. 

The start position is 0-based and the end position is 1-based, following the BED file convention (i.e., the interval covers [start, end)).
	
BioGenomicInterval is the core interval abstraction in the BioBED module. 
It provides interval arithmetic operations (intersect, union, subtract), overlap queries, promoter region calculation, and integration hooks with BioMAF (mutations), BioOntology (GO/SO terms), and BioPathway.

## Instance Variables

chromosome       <String>   Chromosome name
start            <Integer>  0-based start position
end              <Integer>  1-based end position (exclusive)
strand           <String>   +, -, or .
name             <String>   Feature name or identifier
source           <String>   Source of the interval
featureType      <String>   Type of feature
ontologyTerms    <OrderedCollection>  Linked ontology terms
customAttributes <Dictionary>  Additional key-value attributes

## Example
```
val := BioGenomicInterval from: 100 to: 500 on: chr1 strand: $+.
interval overlapsInterval: anotherInterval.
interval intersect: anotherInterval.
interval promoterRegion: 1000 downstream: 200.
```
"
Class {
	#name : 'BioGenomicInterval',
	#superclass : 'Object',
	#instVars : [
		'chromosome',
		'start',
		'end',
		'strand',
		'name',
		'source',
		'featureType',
		'ontologyTerms',
		'customAttributes'
	],
	#category : 'BioParsers-BED',
	#package : 'BioParsers',
	#tag : 'BED'
}

{ #category : 'as yet unclassified' }
BioGenomicInterval class >> from: startInt to: endInt on: aChromosome [ ^ self new chromosome: aChromosome; start: startInt; end: endInt; yourself
]

{ #category : 'as yet unclassified' }
BioGenomicInterval class >> from: startInt to: endInt on: aChromosome strand: aStrand [ ^ self new chromosome: aChromosome; start: startInt; end: endInt; strand: aStrand; yourself
]

{ #category : 'adding' }
BioGenomicInterval >> addOntologyTerm: aTerm [
	ontologyTerms add: aTerm
]

{ #category : 'accessing' }
BioGenomicInterval >> annotateWithOntology: anOntology [
	| matches |
	matches := anOntology termsMatching: self featureType.
	matches do: [ :t | self addOntologyTerm: t ].
	^ matches
]

{ #category : 'converting' }
BioGenomicInterval >> asBEDString [
	^ String tab join: {
		self chromosome.
		self start asString.
		self end asString }
]

{ #category : 'converting' }
BioGenomicInterval >> asGFF [

	^ String tab join: {
			  self chromosome.
			  'region'.
			  'feature'.
			  self start asString.
			  self end asString.
			  '.'.
			  self strand.
			  '.'.
			  '.' }
]

{ #category : 'accessing' }
BioGenomicInterval >> chromosome [
	^ chromosome
]

{ #category : 'accessing' }
BioGenomicInterval >> chromosome: aString [
	chromosome := aString
]

{ #category : 'accessing' }
BioGenomicInterval >> containsInterval: anInterval [

	^ self chromosome = anInterval chromosome and: [
		  anInterval start >= self start and: [ anInterval end <= self end ] ]
]

{ #category : 'testing' }
BioGenomicInterval >> containsPosition: aPosition [
	^ aPosition >= start and: [ aPosition < end ]
]

{ #category : 'copying' }
BioGenomicInterval >> copy [
	^ self class new
		chromosome: self chromosome;
		start: self start;
		end: self end;
		strand: self strand;
		name: self name;
		source: self source;
		featureType: self featureType;
		yourself
]

{ #category : 'accessing' }
BioGenomicInterval >> customAttributes [
	^ customAttributes
]

{ #category : 'accessing' }
BioGenomicInterval >> end [
	^ end
]

{ #category : 'accessing' }
BioGenomicInterval >> end: anInteger [
	end := anInteger
]

{ #category : 'rectangle functions' }
BioGenomicInterval >> expandBy: nBases [
	^ self class new
		chromosome: self chromosome;
		start: (self start - nBases max: 0);
		end: self end + nBases;
		strand: self strand;
		name: self name;
		yourself
]

{ #category : 'accessing' }
BioGenomicInterval >> featureType [
	^ featureType
]

{ #category : 'accessing' }
BioGenomicInterval >> featureType: aString [
	featureType := aString
]

{ #category : 'initialization' }
BioGenomicInterval >> initialize [
	super initialize.
	start := 0.
	end := 0.
	strand := '.'.
	name := ''.
	source := ''.
	featureType := ''.
	ontologyTerms := OrderedCollection new.
	customAttributes := Dictionary new
]

{ #category : 'rectangle functions' }
BioGenomicInterval >> intersect: anInterval [
	(self overlapsInterval: anInterval) ifFalse: [ ^ nil ].
	^ self class new
		chromosome: self chromosome;
		start: (self start max: anInterval start);
		end: (self end min: anInterval end);
		strand: self strand;
		yourself
]

{ #category : 'testing' }
BioGenomicInterval >> isAdjacentTo: anInterval [
	(self chromosome = anInterval chromosome) ifFalse: [ ^ false ].
	^ self end = anInterval start or: [ anInterval end = self start ]
]

{ #category : 'testing' }
BioGenomicInterval >> isEmpty [
	^ end <= start
]

{ #category : 'testing' }
BioGenomicInterval >> isForwardStrand [
	^ strand = '+'
]

{ #category : 'testing' }
BioGenomicInterval >> isReverseStrand [
	^ strand = '-'
]

{ #category : 'testing' }
BioGenomicInterval >> isUnstranded [
	^ strand = '.' or: [ strand isEmpty or: [ strand isNil ] ]
]

{ #category : 'accessing' }
BioGenomicInterval >> length [
	^ end - start max: 0
]

{ #category : 'attachments' }
BioGenomicInterval >> midpoint [
	^ start + ((end - start) // 2)
]

{ #category : 'accessing' }
BioGenomicInterval >> name [
	^ name
]

{ #category : 'accessing' }
BioGenomicInterval >> name: aString [
	name := aString
]

{ #category : 'accessing' }
BioGenomicInterval >> ontologyTerms [
	^ ontologyTerms
]

{ #category : 'accessing' }
BioGenomicInterval >> overlappingMutations: aBioMutationSet [

	^ aBioMutationSet mutations select: [ :m |
			  self chromosome = m chromosome and: [
				  m startPosition >= self start and: [ m startPosition < self end ] ] ]
]

{ #category : 'accessing' }
BioGenomicInterval >> overlapsInterval: anInterval [

	self chromosome = anInterval chromosome ifFalse: [ ^ false ].
	^ self start < anInterval end and: [ self end > anInterval start ]
]

{ #category : 'printing' }
BioGenomicInterval >> printOn: aStream [
	aStream nextPutAll: self chromosome.
	aStream nextPutAll: ':'.
	aStream nextPutAll: self start asString.
	aStream nextPutAll: '-'.
	aStream nextPutAll: self end asString
]

{ #category : 'accessing' }
BioGenomicInterval >> promoterRegion: upstream downstream: downstream [

	| newStart newEnd |
	self isForwardStrand
		ifTrue: [
				newStart := self start - upstream.
				newEnd := self start + downstream ]
		ifFalse: [
				newStart := self end - downstream.
				newEnd := self end + upstream ].
	newStart := newStart max: 0.
	^ self class new
		  chromosome: self chromosome;
		  start: newStart;
		  end: newEnd;
		  strand: self strand;
		  name: self name , '_promoter';
		  yourself
]

{ #category : 'accessing' }
BioGenomicInterval >> source [
	^ source
]

{ #category : 'accessing' }
BioGenomicInterval >> source: aString [
	source := aString
]

{ #category : 'accessing' }
BioGenomicInterval >> start [
	^ start
]

{ #category : 'accessing' }
BioGenomicInterval >> start: anInteger [
	start := anInteger
]

{ #category : 'accessing' }
BioGenomicInterval >> strand [
	^ strand
]

{ #category : 'accessing' }
BioGenomicInterval >> strand: aString [
	strand := aString
]

{ #category : 'accessing' }
BioGenomicInterval >> subtract: anInterval [

	| results |
	(self overlapsInterval: anInterval) ifFalse: [ ^ { self copy } ].
	results := OrderedCollection new.
	self start < anInterval start ifTrue: [
			results add: (self class new
					 chromosome: self chromosome;
					 start: self start;
					 end: (anInterval start min: self end);
					 strand: self strand;
					 yourself) ].
	self end > anInterval end ifTrue: [
			results add: (self class new
					 chromosome: self chromosome;
					 start: (anInterval end max: self start);
					 end: self end;
					 strand: self strand;
					 yourself) ].
	^ results
]

{ #category : 'enumerating' }
BioGenomicInterval >> union: anInterval [
	(self chromosome = anInterval chromosome) ifFalse: [ ^ nil ].
	^ self class new
		chromosome: self chromosome;
		start: (self start min: anInterval start);
		end: (self end max: anInterval end);
		strand: self strand;
		yourself
]
