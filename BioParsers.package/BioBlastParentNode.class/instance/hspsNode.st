accessing hsps
hspsNode

	^ self nodes 
			detect: [: node | node nodeName = 'Hit_hsps' ]
			ifNone: [ self nodes add: ( self nodeFor: 'Hit_hsps' ) ]