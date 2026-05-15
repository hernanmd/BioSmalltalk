"
Abstract base class for Arlequin 3.1 sample types. Provides common behavior for DNA, microsatellite, standard, and frequency samples within the Arlequin framework.
"
Class {
	#name : 'BioA31Sample',
	#superclass : 'BioSample',
	#category : 'BioArlequin-Sample',
	#package : 'BioArlequin',
	#tag : 'Sample'
}

{ #category : 'accessing' }
BioA31Sample >> writeOn: aStream delimiter: aDelimiterCharacter [

	aStream 
		nextPutAll: self identifier;
		nextPut: aDelimiterCharacter;
		nextPutAll: self frequency asString;
		nextPut: aDelimiterCharacter
]
