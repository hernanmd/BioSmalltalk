initialize-release
initialize
	" Private - Initialize receiver's codon tables "
	| tablesCount tableSelectors startIndex |
	
	super initialize.
	tablesCount := 17.	
	startIndex := 1.
	codonTables := OrderedCollection new: tablesCount.
	tablesCount timesRepeat: [
		tableSelectors := self tableSelectors asSortedCollection copyFrom: startIndex to: startIndex + 4.
		codonTables add: (self newCodonTable: self selectors: tableSelectors).
		startIndex := startIndex + 5 ]