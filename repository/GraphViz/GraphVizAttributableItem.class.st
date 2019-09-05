Class {
	#name : #GraphVizAttributableItem,
	#superclass : #GraphVizItem,
	#instVars : [
		'attributes',
		'inheritedStyle'
	],
	#category : 'GraphViz-Model'
}

{ #category : #accessing }
GraphVizAttributableItem >> attributeAt: symbol [

	^ self attributes at: symbol
]

{ #category : #accessing }
GraphVizAttributableItem >> attributeAt: symbol ifAbsent: aBlock [

	^ self attributes at: symbol ifAbsent: aBlock
]

{ #category : #accessing }
GraphVizAttributableItem >> attributeAt: key put: value [

	attributes at: key put: value
]

{ #category : #accessing }
GraphVizAttributableItem >> attributes [

	^ (Dictionary newFrom: inheritedStyle attributes) addAll: attributes; yourself
]

{ #category : #'error handling' }
GraphVizAttributableItem >> doesNotUnderstand: aMessage [

	| argCount |
	argCount := aMessage arguments size.
	argCount = 0 ifTrue: [^ self attributeAt: aMessage selector].
	argCount = 1 ifTrue: [^ self attributeAt: aMessage selector allButLast put: aMessage argument].
	
	^ super doesNotUnderstand: aMessage
]

{ #category : #accessing }
GraphVizAttributableItem >> fontSize [

	^ (self attributeAt: #fontsize ifAbsent: [14]) asNumber
]

{ #category : #accessing }
GraphVizAttributableItem >> inheritedStyle: aGraphVizStyle [

	inheritedStyle := aGraphVizStyle
]

{ #category : #initialization }
GraphVizAttributableItem >> initialize [

	attributes := Dictionary new
]

{ #category : #printing }
GraphVizAttributableItem >> printOn: stream [

	super printOn: stream.
	self writeAttributesOn: stream.
]

{ #category : #streaming }
GraphVizAttributableItem >> writeAttributesOn: stream [
	
	self attributes ifEmpty: [^ self].
	
	stream nextPutAll: ' ['.
	self attributes associations
		do: [:each | self writeAttribute: each key value: each value on: stream]
		separatedBy: [stream nextPut: $,].
		
	stream nextPutAll: ']'
]
