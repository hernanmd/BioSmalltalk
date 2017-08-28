*BioFormatters
dumpCSVTo: aStream

	self flag: #workNeeded.
	self do: [ : each |
		aStream 
			nextPutAll: each asString;
			nextPut: $; ]