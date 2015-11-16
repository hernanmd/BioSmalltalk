*BioPharo4
rowsCollect: aBlock
	" Collect over the receiver performing aBlock on each iteration "
	
	| newCollection |
	newCollection := OrderedCollection new.
	self do: [:each | newCollection add: (aBlock value: each)].
	^ newCollection
