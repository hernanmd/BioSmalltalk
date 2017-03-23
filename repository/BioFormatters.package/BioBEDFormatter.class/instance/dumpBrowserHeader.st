private
dumpBrowserHeader
	" Private - Write custom track browser line "

	self browser properties 
		ifNil: [ ^ self ]
		ifNotNilDo: [ : bp | 
			bp keysAndValuesDo: [ : key : value |
				self outputFileStream
					nextPutAll: key;
					space;
					nextPutAll: value;
					space ].
			self outputFileStream nextPutTerminator ]