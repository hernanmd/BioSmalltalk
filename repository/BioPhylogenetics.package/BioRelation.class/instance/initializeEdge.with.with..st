initialize
initializeEdge: anEdge with: firstNode with: secondNode
	" Private - Initialize the receiver's binary relation "

	self node: (Array with: firstNode with: secondNode).
	self edge: anEdge