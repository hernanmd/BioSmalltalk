accessing
raiseWarning

	^ RaiseWarning
		ifNil: [ RaiseWarning := true ]