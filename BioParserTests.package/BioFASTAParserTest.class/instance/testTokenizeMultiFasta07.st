testing-tokenizer
testTokenizeMultiFasta07

	self assert: ((self parserClass tokenizeMultiFasta: self multiFastaSeq07) bioHasEqualElements: #( 
		#('>Sample sequence 1' 'garkbdctymvhu') 
		#('>Sample sequence 2' 'ctymvhgarkbda')
		#('>Sample sequence 3' 'ccccccccccga'))).
	
	