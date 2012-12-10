accessing
ticks
	"Answer the number of ticks were signalled."

	^parameter == nil
		ifTrue: [ 1 ]
		ifFalse: [ parameter ]