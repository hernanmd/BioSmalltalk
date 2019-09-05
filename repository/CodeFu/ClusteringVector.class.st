Class {
	#name : #ClusteringVector,
	#superclass : #ArrayVector,
	#type : #variable,
	#instVars : [
		'min',
		'found'
	],
	#category : 'CodeFu'
}

{ #category : #'as yet unclassified' }
ClusteringVector >> at: idx put: aNumber [

	super at: idx put: aNumber.
	(found ~~ nil and: [ found = idx or: [ aNumber < min ]]) ifTrue: [ found := nil ].
	^aNumber.
]

{ #category : #'as yet unclassified' }
ClusteringVector >> found [

	^found
]

{ #category : #'as yet unclassified' }
ClusteringVector >> min [
	
	"| min0 found0 |"
	found == nil ifTrue: [ self update ].
	"min0 := Unlimited positive.
	1 to: self size do: [ :index |
		(self at: index) < min0 
			ifTrue: [ min0 := (self at: index). found0 := index ]].
	[ found0 = found ] assert."
	^min
]

{ #category : #'as yet unclassified' }
ClusteringVector >> unsetAt: idx [ 

	super at: idx put: Float infinity.
	found = idx ifTrue: [ found := nil ]
]

{ #category : #'as yet unclassified' }
ClusteringVector >> update [

	min := Float infinity.
	1 to: self size do: [ :idx |
		(self at: idx ) < min 
			ifTrue: [ min := (self at: idx). found := idx ]].
]
