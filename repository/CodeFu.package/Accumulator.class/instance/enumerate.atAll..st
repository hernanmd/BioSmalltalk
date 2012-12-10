accumulate
enumerate: aCollection atAll: indices

	indices do: [ :key | self accumulate: (aCollection at: key) ].
	^value