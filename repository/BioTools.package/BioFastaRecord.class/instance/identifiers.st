accessing
identifiers

	^ identifiers
		ifNil: [ identifiers := Dictionary new ]