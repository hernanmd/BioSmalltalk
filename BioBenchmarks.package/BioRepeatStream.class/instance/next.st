accessing
next

	position >= readLimit ifTrue: [ self position: 0 ].
	repeatPtr := repeatPtr + 1.
	^ collection at: (position := position + 1)