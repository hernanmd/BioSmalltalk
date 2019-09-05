Class {
	#name : #BioA31Sample,
	#superclass : #BioSample,
	#category : 'BioArlequin-Sample'
}

{ #category : #accessing }
BioA31Sample >> writeOn: aStream delimiter: aDelimiterCharacter [

	aStream 
		nextPutAll: self identifier;
		nextPut: aDelimiterCharacter;
		nextPutAll: self frequency asString;
		nextPut: aDelimiterCharacter
]
