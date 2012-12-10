scanning
atEnd

	term == Terms void ifTrue: [ term := self privateNext ].
	^term isNil