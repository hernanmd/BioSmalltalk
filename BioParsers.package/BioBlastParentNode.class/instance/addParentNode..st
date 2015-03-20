accessing nodes
addParentNode: aGTBLASTParentNode

	self nodes isEmpty
		ifTrue: [ self nodes add: aGTBLASTParentNode ]
		ifFalse: [ 
			self nodes last isParentNode 
				ifTrue: [ self nodes last addNode:  aGTBLASTParentNode ]
				ifFalse: [ self nodes add: aGTBLASTParentNode ] ]