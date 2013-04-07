initialize-release
initialize
	" Private - Initialize receiver's codon tables "
	| tablesCount tableSelectors startIndex |
	
	super initialize.
	startIndex := 1.
	tablesCount := 17.
	codonTables := OrderedCollection new: tablesCount.
	tablesCount timesRepeat: [
		tableSelectors := self tableSelectors copyFrom: startIndex to: startIndex + 4.
		codonTables add: (self newCodonTable: self selectors: tableSelectors).
		startIndex := startIndex + 5 ]