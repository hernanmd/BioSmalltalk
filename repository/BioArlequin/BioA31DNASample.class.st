"
Represents a DNA sample in the Arlequin 3.1 format. A DNA sample contains sequence data for haplotype analysis within the Arlequin software framework. See also BioA31Sample for the common sample behavior.
"
Class {
	#name : 'BioA31DNASample',
	#superclass : 'BioA31Sample',
	#category : 'BioArlequin-Sample',
	#package : 'BioArlequin',
	#tag : 'Sample'
}

{ #category : 'accessing' }
BioA31DNASample >> sequenceString [

	^ self sequence
]

{ #category : 'accessing' }
BioA31DNASample >> writeOn: aStream [
	" Write the receiver's data into aStream "

	aStream
		nextPutAll: self identifier;
		space;
		nextPutAll: self sequenceString;
		nextPutAll: GRPlatform current newline
]

{ #category : 'accessing' }
BioA31DNASample >> writeOn: aStream delimiter: aDelimiterCharacter [
	" Write the receiver's data into aStream "

	super writeOn: aStream delimiter: aDelimiterCharacter.
"	self sequenceString
		do: [ :letter | 
			aStream
				nextPut: letter;
				nextPut: aDelimiterCharacter ].
	aStream nextPutAll: GRPlatform current newline"
]
