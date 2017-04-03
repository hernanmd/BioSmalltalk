private
findAlleleRefCount 

	^ dataPoints collect: [ : a | 
			a first = '11' 
				ifTrue: [ 2 ] 
				ifFalse: [ 
					a first = '01' 
						ifTrue: [ 1 ] 
						ifFalse: [ 0 ] ] ].