*BioTools
dumpToStream: aStream
	" Private - Write the receiver's contents into aStream "
	
	self do: [ : each | each dumpToStream: aStream ]
