initialization
initializeMatrix

	matrix := DhbMatrix rows: 3 columns: self snpCount.
	matrix atAllPut: 0.
	1 to: self snpCount do: [ : colIndex | 
		dataPoints pairsDo: [ :hapArray1 :hapArray2 | 
			| h1 h2 |
			h1 := hapArray1 at: colIndex.
			h2 := hapArray2 at: colIndex.
			(h1 = $1 and: [ h2 = $1 ])
				ifTrue: [ matrix at: 1 at: colIndex put: (matrix at: 1 at: colIndex) + 1 ]
				ifFalse: [ 
					(h1 = $0 and: [ h2 = $1 ])
						ifTrue: [ matrix at: 2 at: colIndex put: (matrix at: 2 at: colIndex) + 1 ]
						ifFalse: [ 
							(h1 = $0 and: [ h2 = $0 ])
								ifTrue: [ matrix at: 3 at: colIndex put: (matrix at: 3 at: colIndex) + 1 ]
								ifFalse: [ self error: 'Should not happen' ] ] ] ] ].