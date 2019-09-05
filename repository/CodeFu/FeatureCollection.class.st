Class {
	#name : #FeatureCollection,
	#superclass : #OrderedCollection,
	#type : #variable,
	#instVars : [
		'item'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
FeatureCollection class >> item: anItem features: aCollection [ 

	^((self withAll: aCollection) sorted)
		setItem: anItem;
		yourself
]

{ #category : #distance }
FeatureCollection >> chroniaHausdorffDistance: aFeatureCollection [
	"Answer a modified hausdorff distance between myself and aFeatureCollection. 
	Further information see 'How Developers Drive Software Evolution' (to be published at IWPSE 2005).
	Limitations of the implementation see FeatureCollection>>hausdorffMinima:."

	| distance |
	distance := Accumulator squaredSum.
	distance enumerate: (self hausdorffMinima: aFeatureCollection).
	distance enumerate: (aFeatureCollection hausdorffMinima: self).
	^distance value
]

{ #category : #distance }
FeatureCollection >> dist: aFeatureCollection [

	^self hausdorffDistance: aFeatureCollection
]

{ #category : #distance }
FeatureCollection >> hausdorffDistance: aFeatureCollection [
	"Answer the hausdorff distance between myself and aFeatureCollection. 
	Limitations of the implementation see FeatureCollection>>hausdorffMinima:."

	| distance |
	distance := Accumulator maximum.
	distance enumerate: (self hausdorffMinima: aFeatureCollection).
	distance enumerate: (aFeatureCollection hausdorffMinima: self).
	^distance value
]

{ #category : #private }
FeatureCollection >> hausdorffMinima: aFeatureCollection [
	"Answer for each element in myself the distance to the nearest element in aFeatureCollection.
	Assumes that the elements of both collections are sorted using an ordering that is compatible
	with the distance metric defined between these elements. Thus this implementation works fine
	with any arithemtic values, except points and complex numbers."

	| minima current stream |
	stream := aFeatureCollection readStream.
	current := stream next.
	minima := self collect: [ :a |
		[ stream atEnd not and: [ (current dist: a) >= (stream peek dist: a) ] ] whileTrue: [ current := stream next ].
		(current dist: a)
	].
	^minima
]

{ #category : #accessing }
FeatureCollection >> item [
	^item
]

{ #category : #accessing }
FeatureCollection >> setItem: anObject [ 
	item := anObject
]

{ #category : #distance }
FeatureCollection >> sizeDistance: aFeatureCollection [

	^self size dist: aFeatureCollection size
]
