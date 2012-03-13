adding
addNewStyle: anObject with: associations

	| atts style |
	(GraphVizStyle styleNodes includes: anObject) ifFalse: [^ self].
	
	atts := associations asOrderedCollection.
	
	style := GraphVizStyle new id: anObject.
	
	anObject = #node ifTrue:
		[currentNodeStyle attributes keysAndValuesDo: [:key :value | style attributeAt: key put: value].
		currentNodeStyle := style].
	
	anObject = #edge ifTrue:
		[currentEdgeStyle attributes keysAndValuesDo: [:key :value | style attributeAt: key put: value].
		currentEdgeStyle := style].
	
	atts do: [:each | style attributes at: each key put: each value].	
	
	^ self addNewChild: style