initialize-release
initialize
	" Private - See superimplementor's comment "
	
	super initialize.	
	parser := self mafHeaderParser , self mafBodyParser.
