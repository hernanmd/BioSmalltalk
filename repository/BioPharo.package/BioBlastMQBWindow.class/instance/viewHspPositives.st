callbacks
viewHspPositives
	" Open a view over the receiver's positive (conservative) substitutions in the alignments "

	Cursor read showWhile: [ 	
		self selectedFilter selectHspPositives explore ]