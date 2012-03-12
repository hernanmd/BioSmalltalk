populating
fillDataColumnsFrom: hitCollection

	| columns alignLength |

	self gtLog: 'Started filling columns...'.
	alignLength := hitCollection first alignLength asNumber.	
	columns := OrderedCollection new: alignLength.
	1 to: alignLength do: [: index |
		| column |
		column := Set new: hitCollection size.
		hitCollection do: [: each |
			index <= each hSequence size
				ifTrue: [ column add: ( each hSequence at: index ) ].
		].
		" Add to difference columns collection if there are 
		differences in the current column "
		column size > 1
			ifTrue: [ columns add: index ].
	].
	self gtLog: 'Finished filling columns...'.
	^ columns
	