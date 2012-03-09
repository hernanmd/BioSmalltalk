accessing
nodes

	^ nodes
		ifNil: [ nodes := OrderedCollection new ]