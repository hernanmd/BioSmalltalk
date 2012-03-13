accessing
arrowhead

	^ self attributes at: #arrowhead ifAbsent:
		[self dir caseOf: {
			[#forward] -> [#normal].
			[#both] -> [#normal]}
			otherwise: [#none]]