accessing
rowsDo: aBlock
	" Iterate over the receiver performing aBlock on each iteration "
	
	self parse.
	self results do: [ : each |
		each isNil
			ifFalse: [ aBlock value: each ] 
	].
