weighting
forTerm: aVector

	| globalFrequency probabilitySum |
	globalFrequency := self globalFrequency: aVector.
	probabilitySum := aVector inject: 0 into: [ :sum :each |
		| probability |
		probability := each.
		probability isZero ifFalse: [
			probability := probability / globalFrequency.
			probability := probability * (probability log: 2).
		].
		sum + probability.
	].
	^probabilitySum negated