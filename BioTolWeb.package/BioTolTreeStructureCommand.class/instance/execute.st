accessing
execute
	" Private - See superimplementor's comment "

	self halt.
	self nodeId: self client nodeId.
	^ self parseTreeOfLifeFromXML: super execute result.