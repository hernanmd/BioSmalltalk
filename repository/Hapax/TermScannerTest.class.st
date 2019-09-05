Class {
	#name : #TermScannerTest,
	#superclass : #TestCase,
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #running }
TermScannerTest >> testDanglingLetter [

	self assert: (TermScanner scan: '   a') asArray = #('a').
]

{ #category : #running }
TermScannerTest >> testEmptyString [

	self assert: (TermScanner scan: '') isEmpty
]

{ #category : #running }
TermScannerTest >> testNonLetter [

	self assert: (TermScanner scan: '123456') isEmpty.
	self assert: (TermScanner scan: 'abc123abc') asArray = #('abc' 'abc').
]

{ #category : #running }
TermScannerTest >> testScanWords [

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: 'foo bar') asArray = #('foo' 'bar').
]

{ #category : #running }
TermScannerTest >> testTrailingWhitespace [

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: '  foo  ') asArray = #('foo').
]

{ #category : #running }
TermScannerTest >> testWhitespaceString [

	self assert: (TermScanner scan: '               ') isEmpty.

	self assert: (TermScanner scan: 'foo') asArray = #('foo').
	self assert: (TermScanner scan: '  foo  ') asArray = #('foo').
]
