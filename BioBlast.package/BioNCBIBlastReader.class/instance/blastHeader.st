accessing-blast-meta
blastHeader
	" Answer a String with the parser receiver's contents header "

	^ self selectHeaderNodesIn: self headerContents
	