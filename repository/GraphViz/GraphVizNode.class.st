Class {
	#name : #GraphVizNode,
	#superclass : #GraphVizAttributableItem,
	#instVars : [
		'graph'
	],
	#category : 'GraphViz-Model'
}

{ #category : #accessing }
GraphVizNode >> graph [

	^ graph
]

{ #category : #accessing }
GraphVizNode >> graph: aGraphVizGraph [

	graph := aGraphVizGraph
]

{ #category : #testing }
GraphVizNode >> isNode [

	^ true
]

{ #category : #accessing }
GraphVizNode >> nodeType [

	^ #node
]

{ #category : #streaming }
GraphVizNode >> writeContentsOn: stream withIndent: aNumber for: graph [

	stream nextPutAll: self safeId.
	
	self writeAttributesOn: stream.
]

{ #category : #accessing }
GraphVizNode >> x [

	| pos |
	pos := self attributes at: #pos ifAbsent: [^ nil].
	^ (pos findTokens: ',') first asNumber
]

{ #category : #accessing }
GraphVizNode >> y [

	| pos |
	pos := self attributes at: #pos ifAbsent: [^ nil].
	^ (pos findTokens: ',') second asNumber
]
