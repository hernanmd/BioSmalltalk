testing
testParseAccession03

	self assert: ( self parser parse: 'gi|555|emb|X65215.1|' ) 						version = '1' .
	self assert: ( self parser parse: 'gi|226437718|gb|AC150860.6|' ) 					version = '6'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|' ) 					version = '2'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2345|' ) 				version = '2345'.		
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG' ) 			version = '2'.	
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG|' ) 			version = '2'.
	self assert: ( self parser parse: 'gi|207524544|gb|AC226190.2|ABCDEFG|HIJKL' ) 	version = '2'.	
	self assert: ( self parser parse: 'gb|AC226190.2|' ) 								version = '2'.
	self assert: ( self parser parse: 'AC150530.4' ) 								version = '4'.
	self assert: ( self parser parse: 'AC150707' ) 									version isNil

