accessing
dbNames
	" Answer a Collection for containing the receiver's database names "
	
	^ dbNames
		ifNil: [ dbNames := Set new: 50 ]