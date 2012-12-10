enumerating
with: matrix affect: aBlock

	^self switch: matrix
		caseCoercion: [ number := aBlock value: number value: matrix asNumber ]
		caseMatrix: [ Error raise ].