testing
hasQuerySequence
	" Answer <true> if receiver is a valid sequence "

	^ self querySequence notNil and: [ self querySequence notEmpty ]