accessing
addCFChr: chrString start: chrStart end: chrEnd
	" See superimplementor's comment.
	Count the lines added to the receiver "

	super addCFChr: chrString start: chrStart end: chrEnd.
	self dataLinesCount: self dataLinesCount + 1