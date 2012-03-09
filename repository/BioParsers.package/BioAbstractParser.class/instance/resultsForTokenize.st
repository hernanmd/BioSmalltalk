accessing
resultsForTokenize
	" Answer an object suitable for storing receiver's parsing results "
	
	^ results
		ifNil: [ results := self tokenizeResultClass new ]