enumerating
with: vector affect: aBlock

	^self switch: vector
		caseCoercion: [ number := aBlock value: number value: vector asNumber ]
		caseVector: [ Error raise ].