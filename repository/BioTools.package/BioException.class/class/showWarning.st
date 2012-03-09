accessing
showWarning

	^ ShowWarning
		ifNil: [ ShowWarning := true ]