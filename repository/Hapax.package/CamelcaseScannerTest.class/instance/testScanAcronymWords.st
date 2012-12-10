running
testScanAcronymWords

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