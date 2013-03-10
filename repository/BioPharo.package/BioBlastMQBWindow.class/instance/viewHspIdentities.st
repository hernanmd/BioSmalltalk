callbacks
viewHspIdentities
	" Open a view over the receiver's identity lengths "

	Cursor read showWhile: [ 	
		self selectedFilter selectHspIdentities explore ]