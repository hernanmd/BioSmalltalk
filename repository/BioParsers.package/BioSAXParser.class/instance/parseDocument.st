accessing
parseDocument
	" Private - Parse receiver's input "

	self bioLog: 'Start parsing document...' translated.
	[ self driver reset ]
		on: MessageNotUnderstood
		do: [ :ex | self input reset ].
	super parseDocument.
	self bioLog: 'End parsing document' translated.
	^ results