testing
testParseAccession01

	self assert: (( self parser parse: 'gi|555|emb|X65215.1|' ) 		isKindOf: BioAccession).
	self assert: (( self parser parse: 'gi|226437718|gb|AC150860.6|' )	isKindOf: BioAccession).
	self assert: (( self parser parse: 'gi|207524544|gb|AC226190.2|' )	isKindOf: BioAccession).
	self assert: (( self parser parse: 'gb|AC226190.2|' )				isKindOf: BioAccession).
	self assert: (( self parser parse: 'AC150530.4' )				isKindOf: BioAccession).
	self assert: (( self parser parse: 'AC150707' )					isKindOf: BioAccession).
	
	self assert: (( self parser parse: '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' ) 																isKindOf: BioAccession).
	self assert: (( self parser parse: '>gi|104773257|ref|NC_008054.1| Lactobacillus delbrueckii subsp. bulgaricus ATCC 11842, complete genome' ) 																isKindOf: BioAccession).
	

	
