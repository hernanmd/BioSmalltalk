accessing
dumpToStream: aStream

	contents
		ifNotNil: [ contents dumpToStream: aStream ]