testing-tokenizer
testSingleFasta01

	| seqSelectors parseResults |
	
	seqSelectors := self class superclass organization listAtCategoryNamed: 'samples-single'.
	parseResults := seqSelectors collect: [: sel | self parserClass tokenizeFasta: ( self perform: sel ) ].
		
	parseResults do:[: pResult |
		self assert: pResult isCollection.
		self assert: pResult size = 2 ].