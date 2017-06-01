private
buildRelationsList
	" Private - Build the relations from the adjacency list graph "
	
	self clearRelations.
	self graph do: [  ]