accessing
browser
	^ browser
		ifNil: [ browser := BioPropertyObject new ]