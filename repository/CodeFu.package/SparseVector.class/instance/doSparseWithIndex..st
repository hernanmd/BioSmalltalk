enumerating
doSparseWithIndex: aBlock

	contents do: [ :each | 
		aBlock 
			value: each value 
			value: each key ].