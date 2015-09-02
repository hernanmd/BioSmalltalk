accessing
dumpCSVTo: aStream
	" Write the receiver contents in the following CSV format:
	
	name1[,name2,name3....];synonym1[,synonym2....];location1[,location2....]
	
	names should never be empty "
	self outputNamesTo: aStream.
	self outputSynonymsTo: aStream.
	self outputLocationsTo: aStream