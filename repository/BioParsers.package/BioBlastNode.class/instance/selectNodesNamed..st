accessing nodes
selectNodesNamed: aNodeName
	" Answer a Collection of receiver's nodes named aNodeName "

	| answer |
	answer := OrderedCollection new.
	(self hasNodeNamed: aNodeName)
		ifFalse: [ self nodes do: [ :node | answer addAll: (node selectNodesNamed: aNodeName) ] ]
		ifTrue: [ answer addAll: (self nodes select: [ :node | node nodeName = aNodeName ]) ].
	^ answer