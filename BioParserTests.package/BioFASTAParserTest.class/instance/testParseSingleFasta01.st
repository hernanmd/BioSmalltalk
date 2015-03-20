testing-builder
testParseSingleFasta01

	| seqSelectors parseResults |
	
	seqSelectors := self class superclass organization listAtCategoryNamed: 'samples-single'.
	parseResults := seqSelectors collect: [: sel | self parserClass parseFasta: ( self perform: sel ) ].
		
	parseResults do:[: pResult | self assert: pResult isFastaRecord ].