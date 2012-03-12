accessing
contents
	"Answer all of the contents of the receiver."
	
	" This is due to a possibly bug in the parser objects "
	self needsWork.
	^ super contents withUnixLineEndings