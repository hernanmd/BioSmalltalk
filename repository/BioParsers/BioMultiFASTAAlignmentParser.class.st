Class {
	#name : #BioMultiFASTAAlignmentParser,
	#superclass : #BioFASTAMultiParser,
	#category : #'BioParsers-Core'
}

{ #category : #'accessing-parsers' }
BioMultiFASTAAlignmentParser >> parserForSequence [
	" Configure the receiver's parser to parse DNA alignment (gaps are allowed) "

	^ (#dnaAmbiguousLetterGapped asPParser plus flatten , 
		#newline asPParser plus optional ==> [ :nodes | 
			nodes copyWithoutAll: { Character cr . Character lf } ]) 
				min: 1

]
