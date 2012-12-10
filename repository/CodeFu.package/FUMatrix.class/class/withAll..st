instance creation
withAll: object

	| dimension |
	dimension := self switch: object
		caseMatrix: [ object dimension ]
		caseNestedCollection: [ object size @ object first size ]
		caseCollection: [ 1 @ object size ]
		default: [ 0 ].
	^(self new: dimension)
		atAllPut: object;
		yourself.