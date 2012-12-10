private
xWhitespace

	| previous |
	next isLetter ifFalse: [
		[	previous := next.
			next := stream next.
			($0 == next and: [ previous isSeparator ]) ifTrue: [ self xZeroWord ].
			next isLetter ] whileFalse ].