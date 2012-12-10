comparing
= matrix

	^self switch: matrix
		caseCoercion: [ number = matrix asNumber ]
		caseMatrix: [ matrix = self ].