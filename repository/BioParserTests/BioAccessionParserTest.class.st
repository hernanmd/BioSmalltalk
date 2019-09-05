Class {
	#name : #BioAccessionParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioParserTests-Core'
}

{ #category : #accessing }
BioAccessionParserTest >> parserClass [
	" Private - See superimplementor's comment "

	^ BioAccessionParser 
]

{ #category : #accessing }
BioAccessionParserTest >> setUp [

	super setUp.
	parser := self parserClass new
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession01 [

	self assert: (( self parser parse: 'gi|555|emb|X65215.1|' ) 		isKindOf: BioAccession).
	self assert: (( self parser parse: 'gi|226437718|gb|AC150860.6|' )	isKindOf: BioAccession).
	self assert: (( self parser parse: 'gi|207524544|gb|AC226190.2|' )	isKindOf: BioAccession).
	self assert: (( self parser parse: 'gb|AC226190.2|' )				isKindOf: BioAccession).
	self assert: (( self parser parse: 'AC150530.4' )				isKindOf: BioAccession).
	self assert: (( self parser parse: 'AC150707' )					isKindOf: BioAccession).
	
	self assert: (( self parser parse: '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' ) 																isKindOf: BioAccession).
	self assert: (( self parser parse: '>gi|104773257|ref|NC_008054.1| Lactobacillus delbrueckii subsp. bulgaricus ATCC 11842, complete genome' ) 																isKindOf: BioAccession).
	

	

]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession02 [

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

]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession03 [

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


]

{ #category : #testing }
BioAccessionParserTest >> testTokenizeAccession01 [

	self assert: ( BioParser tokenizeAccession: 'gi|555|emb|X65215.1|' ) = #('X65215' '1') .
	self assert: ( BioParser tokenizeAccession: 'gi|226437718|gb|AC150860.6|' ) = #('AC150860' '6').
	self assert: ( BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2345|' ) = #('AC226190' '2345').
	self assert: ( BioParser tokenizeAccession: 'gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( BioParser tokenizeAccession: 'AC150530.4' ) = #('AC150530' '4').
	self assert: ( BioParser tokenizeAccession: 'AC150707' ) = #('AC150707')
]

{ #category : #testing }
BioAccessionParserTest >> testTokenizeAccession02 [

	self assert: ( self parser tokenize: 'gi|555|emb|X65215.1|' ) = #('X65215' '1') .
	self assert: ( self parser tokenize: 'gi|226437718|gb|AC150860.6|' ) = #('AC150860' '6').
	self assert: ( self parser tokenize: 'gi|207524544|gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( self parser tokenize: 'gi|207524544|gb|AC226190.2345|' ) = #('AC226190' '2345').
	self assert: ( self parser tokenize: 'gb|AC226190.2|' ) = #('AC226190' '2').
	self assert: ( self parser tokenize: 'AC150530.4' ) = #('AC150530' '4').
	self assert: ( self parser tokenize: 'AC150707' ) = #('AC150707').
	
	self assert: ( ( self parser tokenize: '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' ) = #('NC_011206' '1') ).
	self assert: ( ( self parser tokenize: '>gi|104773257|ref|NC_008054.1| Lactobacillus delbrueckii subsp. bulgaricus ATCC 11842, complete genome' ) = #('NC_008054' '1') ).
]
