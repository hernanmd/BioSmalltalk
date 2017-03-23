private
dumpCTHeader
	" Private - Write custom track header line "

	self properties propertiesDo: [ : prop |
		self outputFileStream
				nextPutAll: prop key;
				nextPut: $=;
				nextPutAll: prop value;
				space ].
	self outputFileStream nextPutTerminator