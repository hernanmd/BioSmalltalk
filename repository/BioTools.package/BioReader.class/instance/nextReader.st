accessing
nextReader

	^ nextReader
		ifNil: [ nextReader := self defaultNextReader ]