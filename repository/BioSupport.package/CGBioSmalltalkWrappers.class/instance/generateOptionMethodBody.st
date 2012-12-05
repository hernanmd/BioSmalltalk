accessing
generateOptionMethodBody
	" Private - Write the method body into the code stream "

	codeStream nextPutAll: ' ^ '.
	(self targetSelector includes: $:)
		ifFalse: [ 
			codeStream
				nextPutAll: '''';
				nextPutAll: self targetSelector;
				nextPutAll: '''' ]
		ifTrue: [
			codeStream
				nextPutAll: 'self propertyAt: ''';
				nextPutAll: (self targetSelector copyUpTo: $:);
				nextPutAll: ''' ifAbsentPut: [';
				nextPutAll: (self targetSelector findTokens: ':') last;
				nextPutAll: ' ]' ]