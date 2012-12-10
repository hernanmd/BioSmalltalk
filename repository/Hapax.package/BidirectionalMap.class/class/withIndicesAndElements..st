instance creation
withIndicesAndElements: aCollection

	| map |
	map := self new: aCollection size * 3 // 2.
	aCollection doWithIndex: [ :each :index |
		map at: index put: each ].
	^map