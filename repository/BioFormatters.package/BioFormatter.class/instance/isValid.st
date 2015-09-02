testing
isValid
	" Answer <false> by default because assume receiver's was not #validate: "

	^ isValid
		ifNil: [ isValid := false ]