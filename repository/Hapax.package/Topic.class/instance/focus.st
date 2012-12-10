properties
focus

	| base packages focus |
	base := parent documents.
	packages := base groupedBy: #belongsTo.
	focus := Accumulator sum.
	packages do: [ :package |
		| union | 
		union := package count: [ :each | self includesEntity: each ].
		focus accumulate: (union / self size) * (union / package size).
	].
	^focus value asDouble