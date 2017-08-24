exporting
exportStatementDescription

	(self megaDescription includes: ';')
		ifTrue: [ self error: 'Description must not contain any ;' ].
	self stream
		nextPutAll: '!!Description ';
		nextPutAll: self megaDescription;
		nextPut: $;;
		crlf