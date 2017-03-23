accessing
genotypeValueAt: alArray
	"
  0 means zero copies of reference allele.
  1 means one copy of reference allele.
  2 means two copies of reference allele.
  9 means missing data.	
	"
	^ alArray size = 1 
			ifTrue: [ 
				(alArray at: 1) = '0'
					ifTrue: [ 9 ]
					ifFalse: [ 2 ] ]
			ifFalse: [ 
				alArray size = 2
				ifTrue: [ 
					((alArray at: 1) = '0' and: [ (alArray at: 2) = '0' ])
						ifTrue: [ 9 ]
						ifFalse: [ 1 ] ] ].
