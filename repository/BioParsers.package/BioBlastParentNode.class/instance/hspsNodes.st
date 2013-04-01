hsps accessing
hspsNodes

	^ self nodes select: [: node | node nodeName = 'Hit_hsps' ]
