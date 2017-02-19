accessing - public
execute
	" Execute the receiving action. Answer a <BioResultObject> "
	
	| execAnswer |
	execAnswer := BioExecutionEngine perform: self execSelector with: self cmdLine.
	^ BioResultObject new
		command: self cmdLine;
		result: execAnswer;
		yourself
		
