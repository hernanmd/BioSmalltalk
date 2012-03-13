accessing
safeIdFor: anObject

	| hasWhiteSpace firstCharIsDigit |
	anObject isNumber ifTrue: [^ anObject asString].
	anObject isString ifTrue:
		[(anObject first = $< and: [anObject last = $>]) ifTrue: [^ anObject].
		(anObject first = $" and: [anObject last = $"]) ifTrue: [^ anObject].
		
		hasWhiteSpace := anObject lastSpacePosition > 0.
		hasWhiteSpace ifTrue: [^ '"', anObject, '"'].
		
		firstCharIsDigit := anObject first isDigit.
		firstCharIsDigit ifTrue: [^ '"', anObject, '"'].

		anObject do: [:char | (char isAlphaNumeric or: [char = $_]) ifFalse: [^ '"', anObject, '"']]].
	
	^ anObject asString