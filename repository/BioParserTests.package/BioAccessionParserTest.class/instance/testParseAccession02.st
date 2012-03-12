testing
testParseAccession02

	self assert: ( self parser parse: 'gi|555|emb|X65215.1|' ) name = 'X65215' .
	self assert: ( self parser parse: 'gi|226437718|gb|AC150860.6|' ) name = 'AC150860'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|' ) name = 'AC226190'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2345|' ) name = 'AC226190'.	
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG' ) name = 'AC226190'.	
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG|' ) name = 'AC226190'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG|HIJKL' ) name = 'AC226190'.
	self assert: ( self parser parse: 'gb|AC226190.2|' ) name = 'AC226190'.
	self assert: ( self parser parse: 'AC150530.4' ) name = 'AC150530'.
	self assert: ( self parser parse: 'AC150707' ) name = 'AC150707'
