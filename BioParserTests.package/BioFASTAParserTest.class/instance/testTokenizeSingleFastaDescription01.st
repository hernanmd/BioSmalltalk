testing-builder
testTokenizeSingleFastaDescription01
	
	| seqHeader |
	
	seqHeader := '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'.

	parseResult := self parserClass tokenizeFastaDescription: seqHeader.
	self assert: ( parseResult isKindOf: Collection ).
	self assert: parseResult = 'Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome' 