Class {
	#name : #BioPDBePISAPDBMultimer,
	#superclass : #BioDBObject,
	#category : 'BioEBI-PDBePISA'
}

{ #category : #accessing }
BioPDBePISAPDBMultimer class >> dbName [
	" See superimplementor's comment "
	
	^ 'multimer.pdb'

]

{ #category : #accessing }
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
