Class {
	#name : #BioEntrezUrlTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'url'
	],
	#category : #'BioEntrezTests-Core'
}

{ #category : #testing }
BioEntrezUrlTest >> baseUrl [

	^ BioEntrezClient baseUrl
]

{ #category : #testing }
BioEntrezUrlTest >> testBaseUrl [

	self assert: ( BioEGlobalQuery baseUrl isKindOf: String ).
	self deny: BioEGlobalQuery baseUrl isEmpty.
	
	self assert: ( BioEInfo baseUrl isKindOf: String ).
	self deny: BioEInfo baseUrl isEmpty.

	self assert: ( BioESearch baseUrl isKindOf: String ).
	self deny: BioESearch baseUrl isEmpty.

]

{ #category : #testing }
BioEntrezUrlTest >> testCompleteUrl [
	
	url := (BioEntrezUrl fromString: self baseUrl)
		dbName: 'nuccore';
		cmdName: 'esearch.fcgi';
		addParameters: '&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.

	self 
		assert: (BioWebClientEngine decode: url asString) 
		equals: 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
		
	url := (BioEntrezUrl fromString: self baseUrl)
		dbName: 'nuccore';
		cmdName: 'esearch.fcgi';
		addParameters: 'term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
		
	self 
		assert: (BioWebClientEngine decode: url asString) 
		equals: 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
]

{ #category : #testing }
BioEntrezUrlTest >> testCreation [

	url := BioEntrezUrl fromString: self baseUrl , 'db=pubmed&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	self assert: (url isKindOf: BioEntrezUrl).
	self assert: (url asString isKindOf: String).
	self assert: url scheme equals: 'https'.
	self assert: url authority equals: 'eutils.ncbi.nlm.nih.gov'.

]

{ #category : #testing }
BioEntrezUrlTest >> testDbName [

	url := (BioEntrezUrl fromString: self baseUrl)
			dbName: 'nuccore';
			yourself.
	self assert: url dbName equals: 'nuccore'
]

{ #category : #testing }
BioEntrezUrlTest >> testEmailAddress [

	url := (BioEntrezUrl fromString: self baseUrl)
		emailAddress: 'test@test.com';
		yourself.
	self assert: (url valueForParameter: 'email') equals: 'test@test.com'
]

{ #category : #testing }
BioEntrezUrlTest >> testParameters [

	url := BioEntrezUrl fromString: self baseUrl.
	
	self assert: (url parameters isKindOf: Collection).
	self assert: (url parameters isEmpty).
	
	url setUseHistory.
	self assert: (url parameters isKindOf: Collection).
	self deny: (url parameters isEmpty).
	self assert: url parameters equals: (Array with: 'usehistory')
	

]

{ #category : #testing }
BioEntrezUrlTest >> testToolName [

	url := (BioEntrezUrl fromString: self baseUrl)
		toolName: 'BioSmalltalk';
		yourself.
	self assert: (url valueForParameter: 'tool') equals: 'BioSmalltalk'
]
