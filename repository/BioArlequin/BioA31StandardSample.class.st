Class {
	#name : #BioA31StandardSample,
	#superclass : #BioA31Sample,
	#category : 'BioArlequin-Sample'
}

{ #category : #accessing }
BioA31StandardSample >> writeOn: aStream delimiter: aDelimiterCharacter [
	" Write the receiver's data into aStream "

	self writeOn: aStream.
	self matrices
		do: [ :matrix | 
			aStream
				nextPutAll: matrix;
				nextPutAll: GRPlatform current newline]
]
