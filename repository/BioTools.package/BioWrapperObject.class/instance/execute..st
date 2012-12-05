accessing public - commands
execute: cmdLine
	" Private - Execute the operation specified by anOperationClass "
	
	self bioLog: 'Executing...' , cmdLine asString.
	^ cmdLine