Class {
	#name : #GraphVizEdge,
	#superclass : #GraphVizAttributableItem,
	#instVars : [
		'fromNode',
		'toNode'
	],
	#category : 'GraphViz-Model'
}

{ #category : #accessing }
GraphVizEdge >> arrowhead [

	^ self attributes at: #arrowhead ifAbsent:
		[self dir caseOf: {
			[#forward] -> [#normal].
			[#both] -> [#normal]}
			otherwise: [#none]]
]

{ #category : #accessing }
GraphVizEdge >> arrowtail [

	^ self attributes at: #arrowtail ifAbsent:
		[self dir caseOf: {
			[#back] -> [#normal].
			[#both] -> [#normal]}
			otherwise: [#none]]
]

{ #category : #accessing }
GraphVizEdge >> dir [

	^ self attributes at: #dir ifAbsent: [fromNode graph isDirected ifTrue: [#forward] ifFalse: [#none]]
]

{ #category : #accessing }
GraphVizEdge >> fromNode [

	^ fromNode
]

{ #category : #accessing }
GraphVizEdge >> fromNode: aGraphVizNode [

	fromNode := aGraphVizNode
]

{ #category : #testing }
GraphVizEdge >> isEdge [

	^ true
]

{ #category : #accessing }
GraphVizEdge >> nodeType [

	^ #edge
]

{ #category : #accessing }
GraphVizEdge >> toNode [

	^ toNode
]

{ #category : #accessing }
GraphVizEdge >> toNode: aGraphVizNode [

	toNode := aGraphVizNode
]

{ #category : #accessing }
GraphVizEdge >> vertices [

	| pos |
	pos := self pos ifNil: [^ #()].
	
	^ (pos findTokens: ' ') collect:
		[:each | | point |
		point := each findTokens: ','.
		point first asNumber @ point second asNumber]
]

{ #category : #streaming }
GraphVizEdge >> writeContentsOn: stream withIndent: aNumber for: graph [

	stream nextPutAll: (self safeIdFor: self fromNode id).
	
	graph isDirected 
		ifTrue: [stream nextPutAll: ' -> ']
		ifFalse: [stream nextPutAll: ' -- '].
		
	stream nextPutAll: (self safeIdFor: self toNode id).
	
	self writeAttributesOn: stream.
]
