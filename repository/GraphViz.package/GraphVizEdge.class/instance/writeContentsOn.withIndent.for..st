streaming
writeContentsOn: stream withIndent: aNumber for: graph

	stream nextPutAll: (self safeIdFor: self fromNode id).
	
	graph isDirected 
		ifTrue: [stream nextPutAll: ' -> ']
		ifFalse: [stream nextPutAll: ' -- '].
		
	stream nextPutAll: (self safeIdFor: self toNode id).
	
	self writeAttributesOn: stream.