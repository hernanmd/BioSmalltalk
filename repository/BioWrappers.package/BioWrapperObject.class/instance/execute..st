accessing - public
execute: anOperationClass
	" Private - Execute the operation specified by anOperationClass "
	
	self bioLog: 'Executing...' , anOperationClass asString.
	^ (anOperationClass on: self copy) execute
