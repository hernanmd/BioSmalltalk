accessing
dir

	^ self attributes at: #dir ifAbsent: [fromNode graph isDirected ifTrue: [#forward] ifFalse: [#none]]