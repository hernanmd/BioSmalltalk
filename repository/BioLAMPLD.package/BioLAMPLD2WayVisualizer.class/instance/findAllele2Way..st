private
findAllele2Way: alleleCode

	^ alleleCode = '11' 
		ifTrue: [ 2 ] 
		ifFalse: [ 
			alleleCode = '01' 
				ifTrue: [ 1 ] 
				ifFalse: [ 0 ] ].