Class {
	#name : #Topic,
	#superclass : #Object,
	#instVars : [
		'color',
		'parent',
		'cluster'
	],
	#category : 'Hapax'
}

{ #category : #constants }
Topic class >> defaultColors [

	^#(
			red
			blue
			cyan
			green
			orange

			darkMagenta
			magenta
			yellow
			purple

			darkGreen
			orange
			pink
			olive
			gray

	) collect: [ :each | ColorValue perform: each ].
]

{ #category : #'instance creation' }
Topic class >> in: partition withAll: cluster [

	^(self new)
		instVarNamed: 'cluster' put: cluster;
		instVarNamed: 'parent' put: partition;
		yourself
]

{ #category : #accessing }
Topic >> cluster [

	^cluster
]

{ #category : #accessing }
Topic >> color [
	^color
]

{ #category : #accessing }
Topic >> color: anObject [
	color := anObject
]

{ #category : #accessing }
Topic >> documents [

	^cluster
]

{ #category : #accessing }
Topic >> endIndex [

	^cluster index + cluster size - 1
]

{ #category : #properties }
Topic >> focus [

	| base packages focus |
	base := parent documents.
	packages := base groupedBy: #belongsTo.
	focus := Accumulator sum.
	packages do: [ :package |
		| union | 
		union := package count: [ :each | self includesEntity: each ].
		focus accumulate: (union / self size) * (union / package size).
	].
	^focus value asDouble
]

{ #category : #'As yet unclassified' }
Topic >> includes: anEntity [

	^cluster includes: anEntity
]

{ #category : #'As yet unclassified' }
Topic >> includesEntity: anEntity [

	^cluster includes: anEntity
]

{ #category : #accessing }
Topic >> parent [
	^parent
]

{ #category : #accessing }
Topic >> parent: anObject [
	parent := anObject
]

{ #category : #printing }
Topic >> printOn: aStream [

	self basicPrintOn: aStream.
	aStream space print: self color.
]

{ #category : #'distance functions' }
Topic >> similarity: aConcept [

	| sum tally |
	[ self parent = aConcept parent ] assert.
	sum := 0. tally := 0.
	self startIndex to: self endIndex do: [ :row |
		aConcept startIndex to: aConcept endIndex do: [ :column |
			sum := sum + (self parent at: row and: column).
			tally := tally + 1. ]].
	^sum / tally
]

{ #category : #accessing }
Topic >> size [

	^cluster size
]

{ #category : #properties }
Topic >> spread [
]

{ #category : #accessing }
Topic >> startIndex [

	^cluster index
]
