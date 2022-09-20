Class {
	#name : #BioWebBlastResult,
	#superclass : #BioWebResult,
	#instVars : [
		'maxRetry',
		'requestCount'
	],
	#category : #'BioBlast-Remote'
}

{ #category : #private }
BioWebBlastResult >> executeFirstRequest: aClient [
	"Private - The first BLAST request is used to get the RID and RTOE"

	| rid |
	
	requestCount := 0.
	self bioLog: 'Fetching NCBI BLAST request identifier...'.
	self reader results: aClient url activate.

	rid := self reader rid	.
	self bioLog: 'RTOE = ' , self reader rtoe.
	self bioLog: 'RID = ' , rid.

	self bioLog: 'Delaying for the first request at least 20 seconds'.
	(Delay forSeconds: 20) wait.
	aClient 
		rid: rid;
		fetch. 
]

{ #category : #accessing }
BioWebBlastResult >> executeFor: aClient [
	" Private - Perform the actual search using aClient parameters "
	
	^ self reader results
		ifNil: [ self executeFirstRequest: aClient ]
		ifNotNil: [ self executeQuery: aClient ].

	
]

{ #category : #private }
BioWebBlastResult >> executeQuery: aClient [
	" Private - Perform again a request "

	self reader selectStatus
		ifTrue: [ 
			self result: (BioNCBIBlastReader newFrom: self).
			self beSuccess.
			self bioLog: 'Finished successfully' translated ]
		ifFalse: [ 
			self executeTryRequest: aClient ].

]

{ #category : #private }
BioWebBlastResult >> executeTryRequest: aClient [
	" Private - Perform again a request "

	requestCount := requestCount + 1.
	self bioLog: 'Sending another NCBI BLAST request...'.			
	self reader results: aClient getUrl activate.
	self bioLog: 'NCBI BLAST request sent, waiting for results...'.
	self maxRetry > requestCount
		ifTrue: [ self executeFor: aClient ]
		ifFalse: [ 
			self signalInvalidObject: 'Number of retries reached, aborting remote BLAST'.
			self beFailed ]

]

{ #category : #accessing }
BioWebBlastResult >> maxRetry [
	" Answer the number of remote retries. Reaching this number could
	indicate a fail in delaying for results  "
	
	^ maxRetry
		ifNil: [ maxRetry := 10 ]
]

{ #category : #accessing }
BioWebBlastResult >> maxRetry: anObject [
	maxRetry := anObject
]

{ #category : #private }
BioWebBlastResult >> readerClass [

	^ BioQBlastReader
]
