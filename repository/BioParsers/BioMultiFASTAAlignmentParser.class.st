Class {
	#name : #BioMultiFASTAAlignmentParser,
	#superclass : #BioFASTAMultiParser,
	#category : #'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioMultiFASTAAlignmentParser >> parserForSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	^ (#dnaAmbiguousLetterGapped asParser plus flatten , 
		#newline asParser plus optional ==> [ :nodes | (nodes copyWithout: Character cr) ]) 
			min: 1

]
