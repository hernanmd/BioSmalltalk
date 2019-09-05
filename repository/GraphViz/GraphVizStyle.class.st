Class {
	#name : #GraphVizStyle,
	#superclass : #GraphVizNode,
	#category : 'GraphViz-Model'
}

{ #category : #'as yet unclassified' }
GraphVizStyle class >> styleNodes [

	^ #(graph node edge) 
]

{ #category : #accessing }
GraphVizStyle >> attributes [

	^ attributes
]

{ #category : #testing }
GraphVizStyle >> isNode [

	^ false
]

{ #category : #testing }
GraphVizStyle >> isStyle [

	^ true
]

{ #category : #accessing }
GraphVizStyle >> nodeType [

	^ #style
]
