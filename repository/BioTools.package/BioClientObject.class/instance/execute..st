accessing public - commands
execute: anOperationClass
	" Private - Execute the operation specified by anOperationClass "
	
	self gtLog: 'Executing...' , anOperationClass asString.
	^ ( anOperationClass on: self copy ) execute