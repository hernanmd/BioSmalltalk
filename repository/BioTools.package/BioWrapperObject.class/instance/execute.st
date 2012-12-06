accessing public
execute
	"Execute the receiving action"
	
	| execAnswer |
	
	execAnswer := BioExecutionEngine execute: self cmdLine.
	^ BioResultObject new
		result: execAnswer;
		yourself
		
