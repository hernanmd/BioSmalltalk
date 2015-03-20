testing
testTokenizeAccession02

	self assert: ( self parser tokenize: 'gi|555|emb|X65215.1|' ) = #('X65215' '1') .
	self assert: ( self parser tokenize: 'gi|226437718|gb|AC150860.6|' ) = #('AC150860' '6').
	self assert: ( self parser tokenize: 'gi|207524544|gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( self parser tokenize: 'gi|207524544|gb|AC226190.2345|' ) = #('AC226190' '2345').
	self assert: ( self parser tokenize: 'gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( self parser tokenize: 'AC150530.4' ) = #('AC150530' '4').
	self assert: ( self parser tokenize: 'AC150707' ) = #('AC150707').
	
	self assert: ( ( self parser tokenize: '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' ) = #('NC_011206' '1') ).
	self assert: ( ( self parser tokenize: '>gi|104773257|ref|NC_008054.1| Lactobacillus delbrueckii subsp. bulgaricus ATCC 11842, complete genome' ) = #('NC_008054' '1') ).