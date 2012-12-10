private-algorithm
step2

	#(est en er) do: [ :suffix | 
		(self endsWith: suffix in: r1) ifTrue: [
			^self removeSuffix ] ].
	(self endsWith: #st in: (r1 max: 4)) ifTrue: [
		(#ntdhlgmbfk includes: (string at: cursor)) ifTrue: [
			self removeSuffix
		]
	]