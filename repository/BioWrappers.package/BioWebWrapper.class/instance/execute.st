accessing public
execute
	" Execute current receiver's operation and answer a result object "
	
	| rs |
	
	rs := self searchResult executeFor: self.
	self lastStatus: 'Success'.
	^ rs