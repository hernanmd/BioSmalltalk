callbacks
viewHitDefinitions
	" Open a view over the receiver's defintion strings "

	Cursor read showWhile: [ 	
		self selectedFilter selectHitDefinitions explore ]