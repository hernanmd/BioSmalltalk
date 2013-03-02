accessing
useLogger
	" Logger should be used only for debugging purposes "

	^ UseLogger
		ifNil: [ UseLogger := false ]	