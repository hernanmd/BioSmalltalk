private
writeOn: aStream
	" Private - Write the receiver's title and key/value pairs in aStream "
	
	| samplesAssoc sampleCollections |
	
	samplesAssoc := self associations anyOne.
	self writeLabelOn: aStream.
	aStream 
		nextPutAll: samplesAssoc key;
		nextPut: $=;
		nextPut: ${;
		cr.
	sampleCollections := (samplesAssoc value flatCollect: #samples) sortedAs: #identifier.
	sampleCollections asSet 	do: [ : arlequinSample | arlequinSample writeOn: aStream ].
	aStream 
		nextPut: $}