accessing
reader

	^ reader
		ifNil: [ reader := self defaultReaderClass new ]