*BioTools
dumpToStream: aStream
	" Private - Write the receiver's contents into aStream "
	
	self key dumpToStream: aStream.
	aStream nextPut:$;.
	self value dumpToStream: aStream.
