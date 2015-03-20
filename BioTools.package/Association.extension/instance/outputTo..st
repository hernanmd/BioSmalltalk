*BioTools
outputTo: aStream
	" Private - Write the receiver's contents into aStream "
	
	self key outputTo: aStream.
	aStream nextPut:$;.
	self value outputTo: aStream.
