accessing
resultsForParse
	" Answer an object suitable for storing receiver's parsing results "
	
	^ results
		ifNil: [ results := self parseResultClass new ]