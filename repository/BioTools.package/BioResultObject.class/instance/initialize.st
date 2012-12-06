initialize-release
initialize
	" Private - Initialize receiver's historical information "
	
	super initialize.
	self name: self definitionString , ' created at ' , date asString.
	self beSuccess.
