streaming
writeContentsOn: stream withIndent: aNumber for: graph

	stream nextPutAll: self safeId.
	
	self writeAttributesOn: stream.