Class {
	#name : 'BioIRanges',
	#superclass : 'BioObject',
	#instVars : [
		'starts',
		'ends',
		'names'
	],
	#category : 'BioTools-Genomic-Ranges',
	#package : 'BioTools',
	#tag : 'Genomic-Ranges'
}

{ #category : 'instance creation' }
BioIRanges class >> starts: startCollection ends: endCollection [
	"Create an IRanges-like vector object from start/end collections."
	^ self new
		starts: startCollection asArray;
		ends: endCollection asArray;
		yourself

]

{ #category : 'instance creation' }
BioIRanges class >> starts: startCollection widths: widthCollection [
	"Create IRanges from starts and widths (inclusive coordinates)."
	| starts widths ends |
	starts := startCollection asArray.
	widths := widthCollection asArray.
	(starts size = widths size) ifFalse: [ self error: 'Starts and widths must have same size' ].
	ends := Array new: starts size.
	1 to: starts size do: [ :i |
		(widths at: i) < 0 ifTrue: [ self error: 'Width cannot be negative' ].
		ends at: i put: ((starts at: i) + (widths at: i) - 1) ].
	^ self starts: starts ends: ends
]

{ #category : 'accessing' }
BioIRanges >> at: anIndex [
	"Return a single-range IRanges."
	^ BioIRanges
		starts: { self startAt: anIndex }
		ends: { self endAt: anIndex }
]

{ #category : 'accessing' }
BioIRanges >> copyWithStarts: newStarts ends: newEnds [
	^ self class starts: newStarts ends: newEnds
]

{ #category : 'accessing' }
BioIRanges >> end [
	^ self ends
]

{ #category : 'accessing' }
BioIRanges >> endAt: anIndex [
	^ ends at: anIndex
]

{ #category : 'accessing' }
BioIRanges >> ends [
	^ ends ifNil: [ #() ]

]

{ #category : 'accessing' }
BioIRanges >> ends: aCollection [
	| arr |
	arr := aCollection asArray.
	(starts notNil and: [ starts size ~= arr size ]) ifTrue: [
		self error: 'Starts and ends must have same size' ].
	1 to: arr size do: [ :i |
		((arr at: i) < (starts at: i)) ifTrue: [ self error: 'End cannot be less than start' ] ].
	ends := arr
]

{ #category : 'accessing' }
BioIRanges >> isEmpty [
	^ self size = 0
]

{ #category : 'accessing' }
BioIRanges >> names [
	^ names ifNil: [ #() ]

]

{ #category : 'accessing' }
BioIRanges >> names: aCollection [
	(aCollection size = self size) ifFalse: [ self error: 'Names must match size' ].
	names := aCollection asArray
]

{ #category : 'printing' }
BioIRanges >> printOn: aStream [
	aStream
		nextPutAll: 'BioIRanges(';
		nextPutAll: self size asString;
		nextPutAll: ' ranges)'
]

{ #category : 'accessing' }
BioIRanges >> select: aBlock [

	| idx selectedStarts selectedEnds |
	idx := OrderedCollection new.
	1 to: self size do: [ :i | (aBlock value: i) ifTrue: [ idx add: i ] ].
	selectedStarts := idx collect: [ :i | self startAt: i ].
	selectedEnds := idx collect: [ :i | self endAt: i ].
	^ self class starts: selectedStarts ends: selectedEnds
]

{ #category : 'accessing' }
BioIRanges >> size [
	^ self starts size
]

{ #category : 'accessing' }
BioIRanges >> start [
	^ self starts
]

{ #category : 'accessing' }
BioIRanges >> startAt: anIndex [
	^ starts at: anIndex
]

{ #category : 'accessing' }
BioIRanges >> starts [
	^ starts ifNil: [ #() ]
]

{ #category : 'accessing' }
BioIRanges >> starts: aCollection [
	starts := aCollection asArray
]

{ #category : 'accessing' }
BioIRanges >> width [
	| out |
	out := Array new: self size.
	1 to: self size do: [ :i | out at: i put: (self widthAt: i) ].
	^ out
]

{ #category : 'accessing' }
BioIRanges >> widthAt: anIndex [
	^ (self endAt: anIndex) - (self startAt: anIndex) + 1
]
