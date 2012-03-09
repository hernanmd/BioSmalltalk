accessing
parseDocument

	self gtLog: 'Start parsing document...' translated.
	self driver reset.
	super parseDocument.
	self gtLog: 'End parsing document' translated.
   ^ results