private
privateNext

	| next |
	buffer reset.
	[	
		[ (next := stream next) isLetter ] whileFalse.
		[ buffer nextPut: next asLowercase.
		  (next := stream next) isLetter ] whileTrue.
		[ (next := stream next) isLetter ] whileFalse.
		stream skip: -1 ]
		on: MessageNotUnderstood 
		do: [ :ex | ex message selector = #isLetter ifFalse: [ex signal]].
	^buffer isEmpty 
		ifTrue: [ nil ]
		ifFalse: [ buffer contents ]