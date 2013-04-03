converting
asString
	" Answer a String representation of the receiver "
	
	^ String streamContents: [ : stream |
		self sequences do: [ : seq | 
			stream 
				nextPutAll: seq asString;
				space;
				nextPutAll: seq name;
				cr ] ]