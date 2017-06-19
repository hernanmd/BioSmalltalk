accessing
bedFormatter
	^ bedFormatter
		ifNil: [ bedFormatter := BioBEDFormatter new ]