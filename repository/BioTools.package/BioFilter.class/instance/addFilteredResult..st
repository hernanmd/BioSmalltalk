accessing
addFilteredResult: aFilteredResult
	" Add aFilter to the receiver filtered results "

	self reader addFilter: self.
	^ ( self contents includes: aFilteredResult )
		ifFalse: [ 
			aFilteredResult filter: self.
			self contents add: aFilteredResult ].
