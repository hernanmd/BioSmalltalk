"
Represents a locus, i.e. a position in a chromosomal location.

Internal Representation and Key Implementation Points.

    Instance Variables
	end:			<Object>
	length:		<Number>
	start:		<Object>
	value:		<Object>


    Implementation Points
"
Class {
	#name : 'BioLocus',
	#superclass : 'BioNamedObject',
	#instVars : [
		'start',
		'end',
		'length',
		'value',
		'chrLocation',
		'position'
	],
	#category : 'BioTools-Biological',
	#package : 'BioTools',
	#tag : 'Biological'
}

{ #category : 'examples' }
BioLocus class >> example01 [

	^ self new
		name: 'BM1818';	
		chrLocation: 'D23S21';
		yourself
		
]

{ #category : 'instance creation' }
BioLocus class >> newFrom: aStart to: anEnd chr: aChr [
	^ self new
		start: aStart;
		end: anEnd;
		recomputeLength;
		chrLocation: aChr;
		yourself
]

{ #category : 'comparing' }
BioLocus >> < aBioLocus [
	"Sort by chromosome then start then end then name."
	self chrLocation = aBioLocus chrLocation ifFalse: [
		^ (self chrLocation ifNil: [ '' ]) < (aBioLocus chrLocation ifNil: [ '' ]) ].
	self start = aBioLocus start ifFalse: [ ^ (self start ifNil: [ 0 ]) < (aBioLocus start ifNil: [ 0 ]) ].
	self end = aBioLocus end ifFalse: [ ^ (self end ifNil: [ 0 ]) < (aBioLocus end ifNil: [ 0 ]) ].
	^ (self name ifNil: [ '' ]) < (aBioLocus name ifNil: [ '' ])
]

{ #category : 'comparing' }
BioLocus >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	(self class = anObject class) ifFalse: [ ^ false ].
	^ self name = anObject name
		and: [ self chrLocation = anObject chrLocation
		and: [ self start = anObject start
		and: [ self end = anObject end
		and: [ self value = anObject value ] ] ] ]
]

{ #category : 'converting' }
BioLocus >> asBedInterval [
	"Answer a 0-based half-open interval pair suitable for BED-like exports.
	Returns an Array {start0 . end0} or nil when no range is present."
	self hasRange ifFalse: [ ^ nil ].
	^ { self start - 1. self end }
]

{ #category : 'converting' }
BioLocus >> asGffInterval [
	"Answer an Array with 1-based closed coordinates {start . end}."
	self hasRange ifFalse: [ ^ nil ].
	^ { self start. self end }
]

{ #category : 'converting' }
BioLocus >> asString [
	" Answer a <String> representation of the receiver "

	^ String
		streamContents: [ :stream | 
			stream
				nextPutAll: self name
				between: $[
				and: $].
			self printRangeOn: stream ]
]

{ #category : 'accessing - public' }
BioLocus >> chrLocation [
	" Answer a <String> with the receiver's chromosome location "

	^ chrLocation
]

{ #category : 'accessing - public' }
BioLocus >> chrLocation: aString [
	" Set the chromosome location of the receiver to be aString "

	chrLocation := aString
]

{ #category : 'testing' }
BioLocus >> containsLocus: aBioLocus [
	"Answer true when aBioLocus is fully contained in receiver.
	Chromosome must match when both are defined."

	(aBioLocus isNil or: [ self hasRange not ]) ifTrue: [ ^ false ].
	aBioLocus hasRange ifFalse: [ ^ false ].
	((self chrLocation notNil 
			and: [ aBioLocus chrLocation notNil ])
				and: [ self chrLocation ~= aBioLocus chrLocation ]) 
					ifTrue: [ ^ false ].
	^ self start <= aBioLocus start and: [ self end >= aBioLocus end ]
]

{ #category : 'testing' }
BioLocus >> containsPosition: aNumber [
	"Alias for rangeIncludes: for a clearer API."
	^ self rangeIncludes: aNumber
]

{ #category : 'copying' }
BioLocus >> copyFrom: aBioLocus [
	"Copy relevant coordinates and metadata from aBioLocus."
	self name: aBioLocus name.
	self chrLocation: aBioLocus chrLocation.
	self start: aBioLocus start.
	self end: aBioLocus end.
	self length: aBioLocus length.
	self position: aBioLocus position.
	self value: aBioLocus value.
	^ self
]

{ #category : 'comparing' }
BioLocus >> distanceTo: aBioLocus [
	"Answer distance in bases to aBioLocus.
	0 when overlapping; nil when not comparable (missing range or chromosome mismatch)."

	(self hasRange not or: [ aBioLocus isNil or: [ aBioLocus hasRange not ] ])
		ifTrue: [ ^ nil ].
	((self chrLocation notNil and: [ aBioLocus chrLocation notNil ])
		and: [ self chrLocation ~= aBioLocus chrLocation ]) 
			ifTrue: [ ^ nil ].
	(self overlaps: aBioLocus) ifTrue: [ ^ 0 ].
	self end < aBioLocus start ifTrue: [ ^ aBioLocus start - self end ].
	^ self start - aBioLocus end
]

{ #category : 'accessing' }
BioLocus >> end [
	" Answer a <Number> of the receiver's end "
	^ end
]

{ #category : 'accessing' }
BioLocus >> end: aNumber [
	" Set aNumber to the receiver's end "
	end := aNumber
]

{ #category : 'accessing' }
BioLocus >> from: aStart length: aLength [
	"Set locus using start and length (inclusive coordinates)."
	self start: aStart.
	self length: aLength.
	end := (aStart isNil or: [ aLength isNil ])
		ifTrue: [ nil ]
		ifFalse: [ aStart + aLength - 1 ].
	^ self
]

{ #category : 'accessing' }
BioLocus >> from: aStart to: anEnd [
	"Set start/end and derive length using inclusive coordinates."
	self start: aStart.
	self end: anEnd.
	self recomputeLength.
	^ self
]

{ #category : 'testing' }
BioLocus >> hasRange [
	"Answer whether receiver has both start and end coordinates."
	^ self start notNil and: [ self end notNil ]
]

{ #category : 'comparing' }
BioLocus >> hash [
	^ { self class. self name. self chrLocation. self start. self end. self value } hash
]

{ #category : 'operations' }
BioLocus >> intersectionWith: aBioLocus [
	"Answer a new BioLocus representing the interval intersection, or nil."
	| newStart newEnd |
	(self overlaps: aBioLocus) ifFalse: [ ^ nil ].
	newStart := self start max: aBioLocus start.
	newEnd := self end min: aBioLocus end.
	^ self class new
		name: (self name ifNil: [ aBioLocus name ]);
		chrLocation: (self chrLocation ifNil: [ aBioLocus chrLocation ]);
		value: (self value ifNil: [ aBioLocus value ]);
		from: newStart to: newEnd;
		yourself
]

{ #category : 'testing' }
BioLocus >> isPoint [
	"Answer whether receiver represents a single-position locus."
	^ self hasRange and: [ self start = self end ]
]

{ #category : 'testing' }
BioLocus >> isValidRange [
	"Answer whether receiver range is well-formed (start <= end)."
	^ self hasRange and: [ self start <= self end ]
]

{ #category : 'accessing' }
BioLocus >> length [
	" Answer a <Number> of the length of this range "
	
	^ length
]

{ #category : 'accessing' }
BioLocus >> length: aNumber [
	" Set the receiver's length to be aNumber "

	length := aNumber
]

{ #category : 'private' }
BioLocus >> normalizeBounds [
	"Ensure start <= end by swapping when needed, then recompute length."
	(start notNil and: [ end notNil and: [ start > end ] ]) ifTrue: [
		| tmp |
		tmp := start.
		start := end.
		end := tmp ].
	self recomputeLength.
	^ self
]

{ #category : 'testing' }
BioLocus >> overlaps: aBioLocus [
	"Answer true if receiver overlaps aBioLocus.
	Chromosome must match when both are defined."
	(aBioLocus isNil or: [ self hasRange not or: [ aBioLocus hasRange not ] ]) ifTrue: [ ^ false ].
	((self chrLocation notNil and: [ aBioLocus chrLocation notNil ])
		and: [ self chrLocation ~= aBioLocus chrLocation ]) ifTrue: [ ^ false ].
	^ self start <= aBioLocus end and: [ aBioLocus start <= self end ]
]

{ #category : 'accessing' }
BioLocus >> position [
	^ position
]

{ #category : 'accessing' }
BioLocus >> position: aNumber [
	" Set the receiver's location to aNumber "
	
	position := aNumber
]

{ #category : 'printing' }
BioLocus >> printChrOn: aStream [
	chrLocation
		ifNil: [ aStream
				space;
				nextPutAll: 'chr: ?' between: $( and: $) ]
		ifNotNil: [ aStream
				space;
				nextPutAll: 'chr:';
				nextPutAll: chrLocation asString between: $( and: $) ]
]

{ #category : 'printing' }
BioLocus >> printLengthOn: aStream [
	length notNil
		ifTrue: [ aStream
				space;
				nextPutAll: self length asString ]
]

{ #category : 'printing' }
BioLocus >> printNameOn: aStream [

	self hasName
		ifTrue: [ 
			aStream
				space;
				nextPutAll: self name between: $[ and: $] ]
		ifFalse: [ 
			aStream
				space;
				nextPutAll: 'Unnamed' between: $[ and: $] ].
]

{ #category : 'printing' }
BioLocus >> printOn: aStream [
	"Private - See superimplementor's comment"

	super printOn: aStream.
	self printNameOn: aStream.
	self hasRange ifTrue: [ self printRangeOn: aStream ].
	self printChrOn: aStream.
	self printLengthOn: aStream.
	self printValueOn: aStream
]

{ #category : 'printing' }
BioLocus >> printRangeOn: stream [

	(self start notNil and: [ self end notNil ])
		ifTrue: [ 
			stream
				space;
				nextPutAll: self start asString;
				nextPut: $-;
				nextPutAll: self end asString ]
]

{ #category : 'printing' }
BioLocus >> printValueOn: aStream [
	value notNil
		ifTrue: [ aStream
				space;
				nextPutAll: value asString ]
]

{ #category : 'accessing' }
BioLocus >> range [
	" Answer an <Interval> with the start and end positions of the receiver "
	
	^ self start to: self end
]

{ #category : 'testing' }
BioLocus >> rangeIncludes: aNumber [
	"Return true if the number lies in the interval between start and stop."
	
	^ self start notNil and: [ self end notNil and: [ self range rangeIncludes: aNumber ] ]
]

{ #category : 'testing' }
BioLocus >> rangeIncludes: posNumber chrLocation: chrNumber [
	"Return true if chrNumber and posNumber lies in the interval between start and stop and chromosomic location ."
	
	^ (self start notNil and: [ self end notNil ]) and: [ self chrLocation = chrNumber and: [ self rangeIncludes: posNumber ] ]
]

{ #category : 'private' }
BioLocus >> recomputeLength [
	"Recompute length from start/end using inclusive genomic coordinates."
	(start isNil or: [ end isNil ])
		ifTrue: [ length := nil ]
		ifFalse: [ length := (end - start) + 1 ].
	^ length
]

{ #category : 'operations' }
BioLocus >> shiftBy: anInteger [
	"Shift range coordinates by anInteger bases."
	self hasRange ifTrue: [
		self start: self start + anInteger.
		self end: self end + anInteger ].
	position notNil ifTrue: [ position := position + anInteger ].
	^ self
]

{ #category : 'accessing' }
BioLocus >> start [
	" Answer a <Number> of the receiver's start "
	^ start
]

{ #category : 'accessing' }
BioLocus >> start: aNumber [
	" Set aNumber to the receiver's start "

	start := aNumber
]

{ #category : 'operations' }
BioLocus >> unionWith: aBioLocus [
	"Answer a new BioLocus spanning receiver and aBioLocus.
	Requires compatible chromosomes when both are defined."
	| newStart newEnd |
	(self hasRange not or: [ aBioLocus isNil or: [ aBioLocus hasRange not ] ]) ifTrue: [ ^ nil ].
	((self chrLocation notNil and: [ aBioLocus chrLocation notNil ])
		and: [ self chrLocation ~= aBioLocus chrLocation ]) ifTrue: [ ^ nil ].
	newStart := self start min: aBioLocus start.
	newEnd := self end max: aBioLocus end.
	^ self class new
		name: (self name ifNil: [ aBioLocus name ]);
		chrLocation: (self chrLocation ifNil: [ aBioLocus chrLocation ]);
		from: newStart to: newEnd;
		yourself
]

{ #category : 'accessing' }
BioLocus >> value [
	^ value
]

{ #category : 'accessing' }
BioLocus >> value: anObject [
	value := anObject
]
