Class {
	#name : #BioEntrezUrlTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'entrezUrl'
	],
	#category : #'BioEntrezTests-Core'
}

{ #category : #testing }
BioEntrezUrlTest >> baseUrl [

	^ BioEntrezClient baseUrl
]

{ #category : #testing }
BioEntrezUrlTest >> setUp [

	super setUp.
	entrezUrl := BioEntrezUrl fromString: self baseUrl
]

{ #category : #testing }
BioEntrezUrlTest >> testBaseUrl [

	self assert: (BioEGlobalQuery baseUrl isKindOf: String).
	self deny: BioEGlobalQuery baseUrl isEmpty.
	
	self assert: (BioEInfo baseUrl isKindOf: String).
	self deny: BioEInfo baseUrl isEmpty.

	self assert: (BioESearch baseUrl isKindOf: String).
	self deny: BioESearch baseUrl isEmpty.

]

{ #category : #testing }
BioEntrezUrlTest >> testCompleteUrl [
	
	| url |
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

	entrezUrl := BioEntrezUrl fromString: self baseUrl , 'db=pubmed&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	self assert: (entrezUrl isKindOf: BioEntrezUrl).
	self assert: (entrezUrl asString isKindOf: String).
	self assert: entrezUrl scheme equals: 'https'.
	self assert: entrezUrl authority equals: 'eutils.ncbi.nlm.nih.gov'.

]

{ #category : #testing }
BioEntrezUrlTest >> testDbName [

	entrezUrl
			dbName: 'nuccore';
			yourself.
	self assert: entrezUrl dbName equals: 'nuccore'
]

{ #category : #testing }
BioEntrezUrlTest >> testEmailAddress [

	entrezUrl
		emailAddress: 'test@test.com';
		yourself.
	self assert: (entrezUrl valueForParameter: 'email') equals: 'test@test.com'
]

{ #category : #tests }
BioEntrezUrlTest >> testEntrezParameters [

	self deny: entrezUrl entrezParameters isEmpty.
	self assert: (entrezUrl entrezParameters noneSatisfy: #isEmpty).
	self assert: (entrezUrl entrezParameters allSatisfy: #isString).
]

{ #category : #testing }
BioEntrezUrlTest >> testParameters [

	self assert: (entrezUrl parameters isKindOf: Collection).
	self assert: (entrezUrl parameters isEmpty).
	
	entrezUrl setUseHistory.
	self assert: (entrezUrl parameters isKindOf: Collection).
	self deny: (entrezUrl parameters isEmpty).
	self assert: entrezUrl parameters equals: (Array with: 'usehistory')
	

]

{ #category : #testing }
BioEntrezUrlTest >> testToolName [

	entrezUrl
		toolName: 'BioSmalltalk';
		yourself.
	self assert: (entrezUrl valueForParameter: 'tool') equals: 'BioSmalltalk'
]
