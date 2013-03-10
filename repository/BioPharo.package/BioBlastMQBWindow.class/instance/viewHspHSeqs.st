callbacks
viewHspHSeqs
	" Open a view over the receiver's alignment lengths "

	Cursor read showWhile: [ 
		self selectedFilter selectHspHSeqs explore ]