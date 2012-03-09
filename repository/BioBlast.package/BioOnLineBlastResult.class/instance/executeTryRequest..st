private
executeTryRequest: aClient
	" Private - Perform again a request "

	requestCount := requestCount + 1.
	self gtLog: 'Sending another NCBI BLAST request...'.			
	self reader results: aClient getUrl activate.
	self gtLog: 'NCBI BLAST request sent, waiting for results...'.
	self maxRetry > requestCount
		ifTrue: [ self executeFor: aClient ]
		ifFalse: [ 
			self signalInvalidObject: 'Number of retries reached, aborting remote BLAST'.
			self beFailed ]
