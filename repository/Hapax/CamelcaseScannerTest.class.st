Class {
	#name : #CamelcaseScannerTest,
	#superclass : #TestCase,
	#category : 'Hapax-InformationRetrieval'
}

{ #category : #running }
CamelcaseScannerTest >> testCompleteSentence [

	self assert: (CamelcaseScanner scan: 'TheNextBIGThing isKindOf: Hype, VeryBIG BIG')
		equals: #('the' 'next' 'BIG' 'thing' 'is' 'kind' 'of' 'hype' 'very' 'BIG' 'BIG')
]

{ #category : #running }
CamelcaseScannerTest >> testDanglingLetter [

	self assert: (CamelcaseScanner scan: 'a') equals: #('a').
	self assert: (CamelcaseScanner scan: 'A') equals:#('A').
	self assert: (CamelcaseScanner scan: 'fooA') equals: #('foo' 'A').
]

{ #category : #running }
CamelcaseScannerTest >> testEmptyString [

	self assert: (CamelcaseScanner scan: '') isEmpty.
	self assert: (CamelcaseScanner scan: '     ') isEmpty.
]

{ #category : #running }
CamelcaseScannerTest >> testNonLetter [

	self assert: (CamelcaseScanner scan: '123456') isEmpty.
	self assert: (CamelcaseScanner scan: 'abc123abc') equals: #('abc' 'abc').
]

{ #category : #running }
CamelcaseScannerTest >> testScanAcronymWords [

	self assert: (CamelcaseScanner scan: 'TheNextBIGThing') 
		equals: #('the' 'next' 'BIG' 'thing').
	
	self assert: (CamelcaseScanner scan: 'TheNextBIG') 
		equals: #('the' 'next' 'BIG').
	
	self assert: (CamelcaseScanner scan: 'BIGThing') 
		equals: #('BIG' 'thing').
	
	self assert: (CamelcaseScanner scan: 'BIG') 
		equals: #('BIG').
	
	self assert: (CamelcaseScanner scan: 'TheNextBIG Thing') 
		equals: #('the' 'next' 'BIG' 'thing').
]

{ #category : #running }
CamelcaseScannerTest >> testScanWords [

	self assert: (CamelcaseScanner scan: 'foo') asArray = #('foo').
	self assert: (CamelcaseScanner scan: 'fooBar') asArray= #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'FooBar') asArray= #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'FooBar ') asArray= #('foo' 'bar').
]

{ #category : #running }
CamelcaseScannerTest >> testWhiteSpaces [
	self assert: (CamelcaseScanner scan: 'foo') asArray = #('foo').
	self assert: (CamelcaseScanner scan: 'fooBar') asArray= #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'FooBar') asArray= #('foo' 'bar').
]

{ #category : #running }
CamelcaseScannerTest >> testZeroWordAreWhitespace [

	self assert: (CamelcaseScanner scan: 'foo100Bar') asArray = #('foo' 'bar').
	self assert: (CamelcaseScanner scan: 'foo10 0Bar') asArray = #('foo').

	self assert: (CamelcaseScanner scan: '0xFFFF foo') asArray = #('foo').
	self assert: (CamelcaseScanner scan: ' 0xFFFF foo') asArray = #('foo').
]
