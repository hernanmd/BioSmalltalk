enumerating
withCountDo: aBlock

	contents associationsDo: [ :each |
		aBlock value: each key value: each value ]