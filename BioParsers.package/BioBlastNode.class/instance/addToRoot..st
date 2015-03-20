accessing
addToRoot: aRootNode
	" Private - Add the receiver to aRootNode "

	(aRootNode isEmpty or: [ self isRootIn: aRootNode ])
		ifTrue: [ aRootNode addRootNode: self ]
		ifFalse: [ aRootNode addNode: self ]