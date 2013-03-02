user interface
searchCallback: searchString

	| searchMethod newMismatches title |

	searchMethod := self selectSearchMethod.
	newMismatches := rootObject select: [: dict | dict perform: searchMethod with: searchString ].
	title := 'Exploring {1} mismatches for {2}' format: { newMismatches size . searchString }.
	self class new
		classifierModel: self classifier;
		openExplorerFor: newMismatches
		withLabel: title