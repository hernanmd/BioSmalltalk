accessing
formatter

	^ formatter
		ifNil: [ formatter := self defaultFormatterClass new ]