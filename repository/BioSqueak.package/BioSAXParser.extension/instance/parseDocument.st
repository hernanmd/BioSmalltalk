*BioSqueak
parseDocument

	self bioLog: 'Start parsing document...' translated.
	super parseDocument.
	self bioLog: 'End parsing document' translated.
   ^ results