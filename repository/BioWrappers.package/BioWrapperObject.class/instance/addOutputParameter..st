accessing - private
addOutputParameter: filename
	" Private - Add filename to the receiver's options stack "

	self parameters addLast: ' > ' , filename