accessing
filterClass

	^ filterClass
		ifNil: [ filterClass := self defaultFilterClass ]