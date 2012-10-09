accessing
parseDna: aString
	" Answer an object with the result of parsing aString with the receiver's parser "
	
	| parseResults |
	
	parseResults := self parseString: aString.
	^ self isSuccess
		ifTrue: [ results := self buildDnaResults: parseResults ]
		ifFalse: [ self signalInvalidObject: parseResults ].