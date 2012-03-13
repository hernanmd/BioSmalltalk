streaming
writeOn: stream withIndent: aNumber for: graph

	self writeHeaderOn: stream withIndent: aNumber.
	
	self writeContentsOn: stream withIndent: aNumber for: graph.
	
	self writeTerminatorOn: stream withIndent: aNumber