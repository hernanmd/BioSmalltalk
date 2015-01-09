exporting
exportStatementDescription

	(self description includes: ';')
		ifTrue: [ self error: 'Description must not contain any ;' ].
	self stream
		nextPutAll: '!Description ';
		nextPutAll: self description;
		nextPut: $;
		crlf