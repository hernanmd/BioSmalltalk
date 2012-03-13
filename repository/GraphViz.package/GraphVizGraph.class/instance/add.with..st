graphing
add: anObject with: associations

	| newEdges newObject |
	
	newObject := anObject isVariableBinding
		ifTrue: 
			[newEdges := self flattenNestedAssocations: anObject.
			newEdges collect: [:each | currentGraphReceiver addNewEdge: each with: associations]]
		ifFalse: 
			[(GraphVizStyle styleNodes includes: anObject)
				ifTrue: [currentGraphReceiver addNewStyle: anObject with: associations]
				ifFalse: 
					[(anObject isCollection and: [anObject isString not])
						ifTrue: [anObject collect: [:each | currentGraphReceiver addNewNode: each with: associations]]
						ifFalse: [currentGraphReceiver addNewNode: anObject with: associations]]].
				
		^ (newObject isCollection and: [newObject size = 1])
			ifTrue: [newObject first]
			ifFalse: [newObject]
