streaming
writeAttributesOn: stream
	
	self attributes ifEmpty: [^ self].
	
	stream nextPutAll: ' ['.
	self attributes associations
		do: [:each | self writeAttribute: each key value: each value on: stream]
		separatedBy: [stream nextPut: $,].
		
	stream nextPutAll: ']'