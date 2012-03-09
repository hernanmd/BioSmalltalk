converting
asString
	" Answer the String representation of the receiver." 	
	
	^ String streamContents: [ : stream |
		self records do: [: record | stream nextPutAll: record asString ] ]