accessing
formatType

	^ formatType
		ifNil: [ formatType := self defaultFormatType ]