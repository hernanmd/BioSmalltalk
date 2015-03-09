accessing
execute
	" Private - See superimplementor's comment "

	self group: self client groupName.
	^ self parseNodeIdFromXML: super execute result.