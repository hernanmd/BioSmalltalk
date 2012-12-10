private-algorithm
step1

	#(ern em en er es e) do: [ :suffix | 
		(self endsWith: suffix in: r1) ifTrue: [
			^self removeSuffix ] ].
	(self endsWith: #s in: r1) ifTrue: [
		(#nrtdhlgmbfk includes: (string at: cursor)) ifTrue: [
			self removeSuffix
		]
	]