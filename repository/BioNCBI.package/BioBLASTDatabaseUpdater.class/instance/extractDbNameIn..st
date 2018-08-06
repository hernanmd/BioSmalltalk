updating
extractDbNameIn: dbName
	" Private - Answer a String with only the database name "
	
	^ (dbName matchesRegex: '(.*)\.:isDigit::isDigit:\.tar\.gz')
		ifTrue: [ 
			| matcher |
			matcher := RxMatcher forString: '(.*)\.:isDigit::isDigit:\.tar\.gz'.
			(matcher matches: dbName)
				ifTrue: [ matcher subexpression: 2 ]
				ifFalse: [ self notify: 'Warning: Unexpected database name' ] ]
		ifFalse: [ ('(.*)\.tar\.gz' asRegex matchesIn: dbName) anyOne copyUpTo: $. ].