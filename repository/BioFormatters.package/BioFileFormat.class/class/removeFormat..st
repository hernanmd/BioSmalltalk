accessing
removeFormat: nameString
	" Remove the format nameString if found from the receiver's registry "
	
	| fmt |
	
	fmt := self formatFor: nameString.
	self registry remove: fmt ifAbsent: [ nil ].
	

			