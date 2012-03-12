testing-builder
testParseSingleFasta07

	parseResult := self parserClass parseFasta: '>gi|6273291|emb|AF191665.1|AF191665
'.
	self deny: ( parseResult isKindOf: BioFastaRecord ).
