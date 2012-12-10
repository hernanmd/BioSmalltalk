accumulate
enumerate: aCollection

	aCollection do: [ :each | self accumulate: each ].
	^value