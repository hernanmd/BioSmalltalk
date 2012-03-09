initialize-release
initializeCodonTables

	| tablesCount tableSelectors startIndex |

	tablesCount := 17.
	self codonTables: ( OrderedCollection new: tablesCount ).
	startIndex := 1.
	tablesCount timesRepeat: [
		tableSelectors := self tableSelectors copyFrom: startIndex to: startIndex + 4.
		self codonTables add: ( self newCodonTable: tableSelectors ).
		startIndex := startIndex + 5.
	]
