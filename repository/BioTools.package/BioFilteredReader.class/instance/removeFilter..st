accessing filters
removeFilter: aFilter
	" Add aFilter to the receiver filtered results. Answer the receiver "

	| qryFilter |

	( self filters includes: aFilter )
		ifTrue: [ self filters remove: aFilter ].
	(qryFilter := self queryFilters 
		detect: [: msg | msg receiver = aFilter ]
		ifNone: [ nil ])
			ifNotNil: [ self queryFilters remove: qryFilter ]