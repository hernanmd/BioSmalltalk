private
privateNext

	| sel |
	next isNil ifTrue: [ ^nil ].
	buffer reset.
	[	
		self xWhitespace.
		next isLowercase 
			ifTrue: [ self xLowercaseWord ]
			ifFalse: [ self xCapitalizedWord ]]
		on: MessageNotUnderstood 
		do: [ :ex | sel := ex message selector. 
				(sel = #isLowercase or: [sel = #asLowercase or: [sel = #isLetter or: [sel = #isAlphaNumeric]]]) ifFalse: [self halt]].
	^buffer isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ buffer contents ].