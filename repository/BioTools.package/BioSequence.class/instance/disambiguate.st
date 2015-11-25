accessing
disambiguate
	" Answer a <Collection> with receiver's sequence disambiguated using IUPAC ambiguity codes "
	| expandedList startNode |
	expandedList := OrderedCollection new.
	startNode := BioDFSNode newWith: String empty remaining: seq.
	self dfsExpandSeq: startNode cumSequences: expandedList.
	^ expandedList
