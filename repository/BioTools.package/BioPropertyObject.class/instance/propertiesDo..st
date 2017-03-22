iterating
propertiesDo: aBlock
	" Evaluate aBlock with each of the receiver's propert as the argument "

	self properties do: aBlock