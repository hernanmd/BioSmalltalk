accessing
genotypeArrayAt: row a1: a1 a2: a2
	" Answer array values at position a1 and a2 in row "

	^ ((row at: a1) = 0 and: [ (row at: a2) = 0 ])
		ifTrue: [ Array empty ]
		ifFalse: [ 
			(row at: a1) = (row at: a2)
				ifTrue: [ Array with: (row at: a1) ]
				ifFalse: [ Array with: (row at: a1) with: (row at: a2) ] ].
