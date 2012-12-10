private-algorithm
preprocessing

	string first = $y ifTrue: [ string at: 1 put: $Y ].
	2 to: string size do: [ :index |
		((string at: index) = $y and: [ self isVowelAt: index - 1 ]) ifTrue: [ string at: index put: $Y ]
	]