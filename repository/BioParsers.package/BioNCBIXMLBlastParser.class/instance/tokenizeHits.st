accessing
tokenizeHits
	" Parse the receiver expression and answer the selected nodes found "

	self tokenizeNodes: self selectedNodes.
	^ self result