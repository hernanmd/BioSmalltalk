accessing
applicationUsers

	^ applicationUsers
		ifNil: [ applicationUsers := Dictionary new ]