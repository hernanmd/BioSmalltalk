accumulate
enumerateWithIndex: aSequencableCollection

	aSequencableCollection doWithIndex: [ :each :index0 | self accumulate: each withIndex: index0 ].
	^value