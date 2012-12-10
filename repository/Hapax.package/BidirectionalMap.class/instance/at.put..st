accessing
at: key put: value

	(backwards includesKey: value) ifTrue: [ Error new signal].
	(forwards includesKey: key) ifTrue: [ backwards removeKey: (forwards at: key) ].

	forwards at: key put: value.
	backwards at: value put: key.
	"[ self checkInvariant ] assert."

	^value