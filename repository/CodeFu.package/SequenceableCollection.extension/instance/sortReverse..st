*codefu
sortReverse: aSortBlock
	"Sort the receiver in-place in reversed order using aSortBlock, which can be one
	of: a closure with two agrument, a closure with one argument or a symbol."

	| block |
	block := aSortBlock asSortBlock.
	SequenceableCollectionSorter sort: self using: [ :a :b | block value: b value: a ].
	^self