enumerating
termsDo: aBlock

	contents associationsDo: [ :each | 
		aBlock value: each key ] "!!! value -> count !!!"