accessing
numberOfXTicks

	^ numberOfXTicks
		ifNil: [ numberOfXTicks := 8 ]