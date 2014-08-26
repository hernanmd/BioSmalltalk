accessing hsps
lastHspNode

	^ self nodes reversed
		detect: [: node | node nodeName = 'Hsp' ]
		ifNone: [ self nodes add: ( self nodeFor: 'Hsp' ) ]