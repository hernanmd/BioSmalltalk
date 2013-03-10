callbacks
viewHspFormattingLines
	" Open a view over the receiver's defintion strings "

	Cursor read showWhile: [ 	
		self selectedFilter selectHspMidLines explore ]