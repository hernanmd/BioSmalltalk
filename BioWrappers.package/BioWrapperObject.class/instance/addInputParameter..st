accessing private
addInputParameter: anObject
	" Private - Add anObject to the receiver's options stack "

	self parameters addLast: '< ' , anObject