accessing-blast-filters
giList
	" Answer a Collection with the gene identifiers numbers from the receiver's results.
	Example output: #('256041716' '256041695' '256041622' ... )"

	^ self hitIdentifiers collect: #asGeneId
