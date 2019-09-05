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
	#name : #BioLocus,
	#superclass : #BioNamedObject,
	#instVars : [
		'start',
		'end',
		'length',
		'value',
		'chrLocation',
		'position'
	],
	#category : #'BioTools-Biological'
}

{ #category : #examples }
BioLocus class >> example01 [

	^ self class new
		name: 'BM1818';	
		chrLocation: 'D23S21';
		beSimpleRepeat;
		yourself
		
]

{ #category : #converting }
BioLocus >> asString [
	" Answer a <String> representation of the receiver "
	
	^ String streamContents: [ : stream |
		stream nextPutAll: self name between: $[ and: $].
		self printRangeOn: stream ]
]

{ #category : #'accessing - public' }
BioLocus >> chrLocation [
	" Answer a <String> with the receiver's chromosome location "

	^ chrLocation
]

{ #category : #'accessing - public' }
BioLocus >> chrLocation: aString [
	" Set the chromosome location of the receiver to be aString "

	chrLocation := aString
]

{ #category : #accessing }
BioLocus >> end [
	" Answer a <Number> of the receiver's end "
	^ end
]

{ #category : #accessing }
BioLocus >> end: aNumber [
	" Set aNumber to the receiver's end "
	end := aNumber
]

{ #category : #accessing }
BioLocus >> length [
	" Answer a <Number> of the length of this range "
	
	^ length
]

{ #category : #accessing }
BioLocus >> length: aNumber [
	" Set the receiver's length to be aNumber "

	length := aNumber
]

{ #category : #accessing }
BioLocus >> position [
	^ position
]

{ #category : #accessing }
BioLocus >> position: aNumber [
	" Set the receiver's location to aNumber "
	
	position := aNumber
]

{ #category : #printing }
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

{ #category : #printing }
BioLocus >> printLengthOn: aStream [
	length notNil
		ifTrue: [ aStream
				space;
				nextPutAll: self length asString ]
]

{ #category : #printing }
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

{ #category : #printing }
BioLocus >> printOn: aStream [
	" Private - See superimplementor's comment "

	super printOn: aStream.
	self printNameOn: aStream.
	self printRangeOn: aStream.
	self printChrOn: aStream.
	self printLengthOn: aStream.
	self printValueOn: aStream
]

{ #category : #printing }
BioLocus >> printRangeOn: stream [

	(self start notNil and: [ self end notNil ])
		ifTrue: [ 
			stream
				space;
				nextPutAll: self start asString;
				nextPut: $-;
				nextPutAll: self end asString ]
]

{ #category : #printing }
BioLocus >> printValueOn: aStream [
	value notNil
		ifTrue: [ aStream
				space;
				nextPutAll: value asString ]
]

{ #category : #accessing }
BioLocus >> range [
	" Answer an <Interval> with the start and end positions of the receiver "
	
	^ self start to: self end
]

{ #category : #testing }
BioLocus >> rangeIncludes: aNumber [
	"Return true if the number lies in the interval between start and stop."
	
	^ self start notNil and: [ self end notNil and: [ self range rangeIncludes: aNumber ] ]
]

{ #category : #testing }
BioLocus >> rangeIncludes: posNumber chrLocation: chrNumber [
	"Return true if chrNumber and posNumber lies in the interval between start and stop and chromosomic location ."
	
	^ (self start notNil and: [ self end notNil ]) and: [ self chrLocation = chrNumber and: [ self rangeIncludes: posNumber ] ]
]

{ #category : #accessing }
BioLocus >> start [
	" Answer a <Number> of the receiver's start "
	^ start
]

{ #category : #accessing }
BioLocus >> start: aNumber [
	" Set aNumber to the receiver's start "

	start := aNumber
]

{ #category : #accessing }
BioLocus >> value [
	^ value
]

{ #category : #accessing }
BioLocus >> value: anObject [
	value := anObject
]
