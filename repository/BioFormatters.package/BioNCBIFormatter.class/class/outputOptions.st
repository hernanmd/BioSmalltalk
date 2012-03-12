class initialization
outputOptions

	^ OutputOptions
		ifNil: [ self initializeOutputOptions.
				OutputOptions ]