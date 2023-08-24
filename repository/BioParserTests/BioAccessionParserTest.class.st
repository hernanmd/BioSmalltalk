Class {
	#name : #BioAccessionParserTest,
	#superclass : #BioAbstractParserTest,
	#category : #'BioParserTests-Core'
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

	parseResult := self parser parse: 'gi|555|emb|X65215.1|'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'X65215'.
	self assert: parseResult version equals: '1'.

]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession02 [

	parseResult := self parser parse: 'gi|226437718|gb|AC150860.6|'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'AC150860'.
	self assert: parseResult version equals: '6'.

]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession03 [

	parseResult := self parser parse: 'gi|207524544|gb|AC226190.2|'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'AC226190'.
	self assert: parseResult version equals: '2'.
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession04 [

	parseResult := self parser parse: 'gb|AC226190.2|'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'AC226190'.
	self assert: parseResult version equals: '2'.
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession05 [

	parseResult := self parser parse: 'AC150530.4'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'AC150530'.
	self assert: parseResult version equals: '4'.
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession06 [

	parseResult := self parser parse: 'AC150707'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'AC150707'.
	self deny: parseResult hasVersion.
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession07 [

	parseResult := self parser parse: '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'NC_011206'.
	self assert: parseResult version equals: '1'.
]

{ #category : #testing }
BioAccessionParserTest >> testParseAccession08 [

	parseResult := self parser parse: '>gi|104773257|ref|NC_008054.1| Lactobacillus delbrueckii subsp. bulgaricus ATCC 11842, complete genome'.
	self assert: (parseResult isKindOf: BioAccession).
	self assert: parseResult name equals: 'NC_008054'.
	self assert: parseResult version equals: '1'.
]

{ #category : #testing }
BioAccessionParserTest >> testTokenizeAccession01 [

	self
		assert: (BioParser tokenizeAccession: 'gi|555|emb|X65215.1|')
		equals: #( 'X65215' '1' ).
	self
		assert: (BioParser tokenizeAccession: 'gi|226437718|gb|AC150860.6|')
		equals: #( 'AC150860' '6' ).
	self
		assert: (BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2|')
		equals: #( 'AC226190' '2' ).
	self
		assert:
		(BioParser tokenizeAccession: 'gi|207524544|gb|AC226190.2345|')
		equals: #( 'AC226190' '2345' ).
	self
		assert: (BioParser tokenizeAccession: 'gb|AC226190.2|')
		equals: #( 'AC226190' '2' ).
	self
		assert: (BioParser tokenizeAccession: 'AC150530.4')
		equals: #( 'AC150530' '4' ).
	self
		assert: (BioParser tokenizeAccession: 'AC150707')
		equals: #( 'AC150707' )
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
