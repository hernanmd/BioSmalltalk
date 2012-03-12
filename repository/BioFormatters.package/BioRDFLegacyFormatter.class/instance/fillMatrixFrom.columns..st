populating
fillMatrixFrom: hitCollection columns: columns

	columns doWithIndex: [: colIndex : cIndex |
		hitCollection doWithIndex: [: each : rIndex |
			| sequence |
			colIndex > ( sequence := each hSequence ) size
				ifFalse: [
					matrix 
						at: rIndex + 4
						at: cIndex 
						put: ( sequence at: colIndex ) ] ].
		].
	