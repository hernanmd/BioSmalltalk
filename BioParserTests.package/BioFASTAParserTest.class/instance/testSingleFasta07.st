testing-tokenizer
testSingleFasta07

	self assert: ( ( self parserClass tokenizeFasta: self fastaSeq09 ) bioHasEqualElements: #('>gi|6273291|emb|AF191665.1|AF191665' 'actgtcgatatgctagct') )		