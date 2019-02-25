accessing-columns
sortReport
	" Answer a <Collection> with columns at indexes. "

	[ 
	| outputCol |
	outputCol := SortedCollection new: self chipSize.
	self collectAffyProbesTo: outputCol.
	self dumpAllAffyProbes: outputCol 
	]
	ensure: [ self outputFileStream close ]