accessing
tokenize: aString
	" Answer an object with the result of tokenizing aString with the receiver's parser "
	
	| parseResults |
	
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ self buildTokens: parseResults ]
		ifFalse: [ parseResults ].