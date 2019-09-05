Class {
	#name : #GraphVizItem,
	#superclass : #Object,
	#instVars : [
		'id'
	],
	#category : 'GraphViz-Model'
}

{ #category : #accessing }
GraphVizItem >> id [

	^ id
]

{ #category : #accessing }
GraphVizItem >> id: anObject [

	id := anObject
]

{ #category : #streaming }
GraphVizItem >> indent: aNumber on: stream [

	aNumber timesRepeat: [stream tab]
]

{ #category : #testing }
GraphVizItem >> isAttribute [

	^ false
]

{ #category : #testing }
GraphVizItem >> isEdge [

	^ false
]

{ #category : #testing }
GraphVizItem >> isGraph [

	^ false
]

{ #category : #testing }
GraphVizItem >> isNode [

	^ false
]

{ #category : #testing }
GraphVizItem >> isStyle [

	^ false
]

{ #category : #testing }
GraphVizItem >> isSubgraph [

	^ false
]

{ #category : #accessing }
GraphVizItem >> nodeType [

	self subclassResponsibility
]

{ #category : #printing }
GraphVizItem >> printOn: aStream [

	aStream 
		nextPutAll: self nodeType;
		nextPut: $ ;
		nextPutAll: self id asString
]

{ #category : #accessing }
GraphVizItem >> safeId [

	^ self safeIdFor: self id
]

{ #category : #accessing }
GraphVizItem >> safeIdFor: anObject [

	| hasWhiteSpace firstCharIsDigit |
	anObject isNumber ifTrue: [^ anObject asString].
	anObject isString ifTrue:
		[(anObject first = $< and: [anObject last = $>]) ifTrue: [^ anObject].
		(anObject first = $" and: [anObject last = $"]) ifTrue: [^ anObject].
		
		hasWhiteSpace := anObject lastSpacePosition > 0.
		hasWhiteSpace ifTrue: [^ '"', anObject, '"'].
		
		firstCharIsDigit := anObject first isDigit.
		firstCharIsDigit ifTrue: [^ '"', anObject, '"'].

		anObject do: [:char | (char isAlphaNumeric or: [char = $_]) ifFalse: [^ '"', anObject, '"']]].
	
	^ anObject asString
]

{ #category : #streaming }
GraphVizItem >> writeAttribute: attribute value: value on: stream [

	stream
		nextPutAll: (self safeIdFor: attribute);
		nextPut: $=;
		nextPutAll: (self safeIdFor: value)
]

{ #category : #streaming }
GraphVizItem >> writeContentsOn: stream withIndent: aNumber for: graph [

	self subclassResponsibility
]

{ #category : #streaming }
GraphVizItem >> writeHeaderOn: stream withIndent: aNumber [

	stream cr.
	self indent: aNumber on: stream.
]

{ #category : #streaming }
GraphVizItem >> writeOn: stream withIndent: aNumber for: graph [

	self writeHeaderOn: stream withIndent: aNumber.
	
	self writeContentsOn: stream withIndent: aNumber for: graph.
	
	self writeTerminatorOn: stream withIndent: aNumber
]

{ #category : #streaming }
GraphVizItem >> writeTerminatorOn: stream withIndent: aNumber [

	stream nextPut: $;
]
