accessing hsps
hspsNodes

	^ self nodes select: [: node | node nodeName = 'Hit_hsps' ]
