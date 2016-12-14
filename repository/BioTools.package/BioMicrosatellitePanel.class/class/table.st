accessing
table
	^ table
		ifNil: [ table := Dictionary new ]