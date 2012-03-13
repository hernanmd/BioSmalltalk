accessing
arrowtail

	^ self attributes at: #arrowtail ifAbsent:
		[self dir caseOf: {
			[#back] -> [#normal].
			[#both] -> [#normal]}
			otherwise: [#none]]