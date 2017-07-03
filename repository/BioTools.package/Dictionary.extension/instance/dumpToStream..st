*BioTools
dumpToStream: aStream
	" Private - Write the receiver's contents into aStream "
	
	self associationsDo: [ : assoc | 
			assoc dumpToStream: aStream.
			aStream bioCr ]
