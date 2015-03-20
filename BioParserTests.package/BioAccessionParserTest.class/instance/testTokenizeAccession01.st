testing
testTokenizeAccession01

	self assert: ( BioParser tokenizeAccession: 'gi|555|emb|X65215.1|' ) = #('X65215' '1') .
	self assert: ( BioParser tokenizeAccession: 'gi|226437718|gb|AC150860.6|' ) = #('AC150860' '6').
	self assert: ( BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2345|' ) = #('AC226190' '2345').
	self assert: ( BioParser tokenizeAccession: 'gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( BioParser tokenizeAccession: 'AC150530.4' ) = #('AC150530' '4').
	self assert: ( BioParser tokenizeAccession: 'AC150707' ) = #('AC150707')