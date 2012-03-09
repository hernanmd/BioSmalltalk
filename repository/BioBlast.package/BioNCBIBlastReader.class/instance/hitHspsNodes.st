accessing-blast
hitHspsNodes
	" Answer a BioBlastNode from the receiver's results (each HSP is contained in its respective HIT node) "

	^ self selectHspNodesIn: self results