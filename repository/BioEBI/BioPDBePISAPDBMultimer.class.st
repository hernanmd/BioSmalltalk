"
Client for PDBe PISA PDB multimer data. Extends BioDBObject with methods to access PDB multimer assembly information.
"
Class {
	#name : 'BioPDBePISAPDBMultimer',
	#superclass : 'BioDBObject',
	#category : 'BioEBI-PDBePISA',
	#package : 'BioEBI',
	#tag : 'PDBePISA'
}

{ #category : 'accessing' }
BioPDBePISAPDBMultimer class >> dbName [
	" See superimplementor's comment "
	
	^ 'multimer.pdb'

]

{ #category : 'accessing' }
BioPDBePISAPDBMultimer >> pdbCode: aString assemblySet: setNumber assemblyNumberInSet: asmNumberOrCollection [
	" Set the receiver's pdbcode to aString, which is a 4-letter PDB code "
	
	| urlParamString |
	
	urlParamString := String streamContents: [ : str | 
		str 
			nextPut: $?;
			nextPutAll: aString asLowercase;
			nextPut: $:;
			nextPutAll: setNumber asString;
			nextPut: $,.
		asmNumberOrCollection isNumber
			ifTrue: [ str nextPutAll: asmNumberOrCollection asString ]
			ifFalse: [ str nextPutAll: (',' join: asmNumberOrCollection) asString ]].
	self client addParameters: urlParamString
]
