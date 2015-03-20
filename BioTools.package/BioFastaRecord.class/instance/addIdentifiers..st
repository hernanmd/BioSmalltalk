accessing
addIdentifiers: aCollection

	aCollection allButLast ifNotEmpty: [ 
		aCollection allButLast pairsDo: [ :k :v |
			self identifiers at: k put: v ] ]