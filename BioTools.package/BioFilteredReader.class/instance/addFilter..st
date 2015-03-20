accessing filters
addFilter: aFilter
	" Add aFilter to the receiver filtered results "

	(self filters includes: aFilter)
		ifFalse: [ self filters add: (aFilter name: self filters size + 1) ].
	^ aFilter