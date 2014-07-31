accessing
matches
	^ matches
		ifNil: [ matches := self defaultMatchesClass new ]