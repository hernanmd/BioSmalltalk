accessing
sparseSize

	| tally |
	tally := 0.
	self do: [ :each | each isZero ifTrue: [ tally := tally + 1 ]].
	^tally