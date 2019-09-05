Class {
	#name : #GraphVizAttribute,
	#superclass : #GraphVizItem,
	#category : 'GraphViz-Model'
}

{ #category : #testing }
GraphVizAttribute >> isAttribute [

	^ true
]

{ #category : #accessing }
GraphVizAttribute >> key [

	^ self id key
]

{ #category : #accessing }
GraphVizAttribute >> nodeType [

	^ #attribute "should not be used by anyone, but this rounds out the need to implement this subclass responsibility"
]

{ #category : #accessing }
GraphVizAttribute >> value [

	^ self id value
]

{ #category : #streaming }
GraphVizAttribute >> writeContentsOn: stream withIndent: aNumber for: graph [

	self writeAttribute: self key value: self value on: stream
]
