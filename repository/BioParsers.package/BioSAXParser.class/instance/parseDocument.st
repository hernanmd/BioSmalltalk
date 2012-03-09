accessing
parseDocument

	self gtLog: 'Start parsing document...' translated.
	[ self driver reset ]
	on: MessageNotUnderstood 
	do: [ : ex | self input reset ].
	super parseDocument.
	self gtLog: 'End parsing document' translated.
   ^ results