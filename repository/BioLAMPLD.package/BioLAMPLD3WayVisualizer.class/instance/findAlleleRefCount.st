private
findAlleleRefCount 

	^ dataPoints collect: [ : a | 
			| alleleCode |
			alleleCode := a first.
			alleleCode = '22'
				ifTrue: [  ]
				ifFalse: [ 
					alleleCode = '12'
						ifTrue: [  ]
						ifFalse: [ 
							alleleCode = '02'
								ifTrue: [  ]
								ifFalse: [ self findAllele2Way: alleleCode ] ] ] ]
