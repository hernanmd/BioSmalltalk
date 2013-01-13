accessing private
addOption: aName value: aValue
	" Private - Add anObject to the receiver's options stack "

	self options addLast:  '-' , aName , ' ' , aValue.