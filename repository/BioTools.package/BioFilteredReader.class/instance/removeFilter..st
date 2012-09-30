accessing filters
removeFilter: aFilter
	" Add aFilter to the receiver filtered results. Answer the receiver "

	| queryFilter |

	(self filters includes: aFilter)
		ifTrue: [ self filters remove: aFilter ].
	(queryFilter := self queryFilters 
		detect: [: msg | msg receiver = aFilter ]
		ifNone: [ nil ])
			ifNotNil: [ self queryFilters remove: queryFilter ]