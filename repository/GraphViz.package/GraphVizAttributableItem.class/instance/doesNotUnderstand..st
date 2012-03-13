error handling
doesNotUnderstand: aMessage

	| argCount |
	argCount := aMessage arguments size.
	argCount = 0 ifTrue: [^ self attributeAt: aMessage selector].
	argCount = 1 ifTrue: [^ self attributeAt: aMessage selector allButLast put: aMessage argument].
	
	^ super doesNotUnderstand: aMessage