callbacks
viewHspAlignLengths
	" Open a view over the receiver's alignment lengths "

	Cursor read showWhile: [ 	
		self selectedFilter selectHspAlignLengths explore ]