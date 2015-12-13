initialize-release
initialize
	" Private - Initialize receiver's metadata "
	
	super initialize.
	self name: self definitionString , ' created at ' , date asString.
	self beSuccess.
