callbacks
execute
	" Private - Execute the receiver query "
	
	self queryManager enableExecution.
	self collectQueries.
	self validateInput.
	self queryManager executeQuery.