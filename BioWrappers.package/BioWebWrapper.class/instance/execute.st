accessing public - commands
execute
	" Execute current operation and answer a result object "
	
	| rs |
	
	rs := self searchResult executeFor: self.
	self lastStatus: 'Success'.
	^ rs