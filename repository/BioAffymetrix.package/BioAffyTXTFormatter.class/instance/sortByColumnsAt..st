accessing-columns
sortByColumnsAt: indexes
	" Answer a <Collection> with columns at indexes. "

	[ 
	| outputCol |
	outputCol := SortedCollection new: self chipSize.
	self collectAffyProbesAt: indexes to: outputCol.
	self dumpAffyProbes: outputCol 
	]
	ensure: [ self outputFileStream close ]