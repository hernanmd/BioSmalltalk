testing
doesNotUnderstand: aMessage

	| argCount |
	argCount := aMessage arguments size.
	argCount = 1 ifTrue: [^ self at: aMessage selector allButLast put: aMessage argument].
	
	^ super doesNotUnderstand: aMessage