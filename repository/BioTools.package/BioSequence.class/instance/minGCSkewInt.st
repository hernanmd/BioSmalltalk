accessing
minGCSkewInt
	" Answer a <Collection> with all the positions where the GC skew reaches its minimum position "
	
	| min minGCs |
	min := self gcSkewInt min.
	minGCs := OrderedCollection new: self size.
	self gcSkewInt withIndexDo: [ : int : i | 
		min = int ifTrue: [ minGCs add: i - 1 ] ].
	^ minGCs