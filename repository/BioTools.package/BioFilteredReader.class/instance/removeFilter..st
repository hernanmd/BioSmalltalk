accessing filters
removeFilter: aFilter
	" Add aFilter to the receiver filtered results. Answer the receiver "

	( self filters includes: aFilter )
		ifTrue: [ self filters remove: aFilter ].