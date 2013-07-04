accessing
genotypeValue: row a1: a1 a2: a2
	"
  0 means zero copies of reference allele.
  1 means one copy of reference allele.
  2 means two copies of reference allele.
  9 means missing data.	
	"
	| genoValue |
	
	((row at: a1) = 0 and: [(row at: a2) = 0])
		ifTrue: [ genoValue := 9 ]
		ifFalse: [ 
			(row at: a1) = (row at: a2)
				ifTrue: [ genoValue := 2 ]
				ifFalse: [ 
					(row at: a1) ~= (row at: a2)
						ifTrue: [ genoValue := 1 ]
						ifFalse: [ genoValue := 0 ] ] ].
	genoValue ifNil: [ self error: 'Invalid genotype value' ].
	^ genoValue