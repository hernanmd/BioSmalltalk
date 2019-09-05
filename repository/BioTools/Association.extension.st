Extension { #name : #Association }

{ #category : #'*BioTools' }
Association >> asSequence [
	" Transform the receiver between 1 and 4**k (key) and k-mer of length k (value) into a  <BioSequence> using an array with k-mers as indices "

	^ ((BioDNAAlphabet new sortedCodes enumerationsOfSize: self value) at: self key) 
		asSequence alphabet: BioDNAAlphabet new;
		yourself
]

{ #category : #'*BioTools' }
Association >> dumpToStream: aStream [
	" Private - Write the receiver's contents into aStream "
	
	self key dumpToStream: aStream.
	aStream nextPut:$;.
	self value dumpToStream: aStream.

]

{ #category : #'*BioTools' }
Association >> setMicrosatelliteGenotypeFor: aBioMicrosatellite [

	aBioMicrosatellite
		start: self key;
		end: self value.

]
