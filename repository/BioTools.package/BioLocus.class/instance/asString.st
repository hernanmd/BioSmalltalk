converting
asString
	" Answer a <String> representation of the receiver "
	
	^ String streamContents: [ : stream |
		stream nextPutAll: self name between: $[ and: $].
		self printRangeOn: stream ]