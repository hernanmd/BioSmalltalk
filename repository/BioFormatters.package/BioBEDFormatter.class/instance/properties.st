accessing - custom track header
properties
	" Use properties object to store track properties "

	^ properties
		ifNil: [ properties := BioPropertyObject new ]