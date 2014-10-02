accessing public
execute
	"Execute the receiving action. Answer a <BioResultObject> "
	
	| execAnswer |
	execAnswer := BioExecutionEngine execute: self cmdLine.
	^ BioResultObject new
		result: execAnswer;
		yourself
		
