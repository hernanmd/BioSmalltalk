initialize-release
initializeCodonTables

	| tablesCount tableSelectors startIndex |

	tablesCount := 17.
	self codonTables: (OrderedCollection new: tablesCount).
	startIndex := 1.
	tablesCount timesRepeat: [
		tableSelectors := BioDNACodonTables tableSelectors copyFrom: startIndex to: startIndex + 4.
		self codonTables add: (self newCodonTable: BioDNACodonTables selectors: tableSelectors).
		startIndex := startIndex + 5 ].
	startIndex := 1.
	tablesCount timesRepeat: [
		tableSelectors := BioRNACodonTables tableSelectors copyFrom: startIndex to: startIndex + 4.
		self codonTables add: (self newCodonTable: BioRNACodonTables selectors: tableSelectors).
		startIndex := startIndex + 5 ]