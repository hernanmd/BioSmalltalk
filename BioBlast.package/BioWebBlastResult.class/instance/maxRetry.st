accessing
maxRetry
	" Answer the number of remote retries. Reaching this number could
	indicate a fail in delaying for results  "
	
	^ maxRetry
		ifNil: [ maxRetry := 10 ]