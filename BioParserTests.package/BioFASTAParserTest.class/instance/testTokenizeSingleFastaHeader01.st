testing-builder
testTokenizeSingleFastaHeader01
	
	| seqHeader |
	
	seqHeader := '>gi|198282148|ref|NC_011206.1| Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome'.

	parseResult := self parserClass tokenizeFastaHeader: seqHeader.
	self assert: ( parseResult isKindOf: Collection ).
	self assert: parseResult = #('>gi' '198282148' 'ref' 'NC_011206.1' 'Acidithiobacillus ferrooxidans ATCC 53993 chromosome, complete genome')