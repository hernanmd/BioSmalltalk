"
emb|accession|ID

"
Class {
	#name : #BioEMBLParser,
	#superclass : #BioAbstractALParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioEMBLParser class >> identifier [
	" See superimplementor's comment "

	^ 'emb'
]

{ #category : #accessing }
BioEMBLParser >> parseId: aString [
	" Answer a String with the ID identifier in aString "
	
	^ (self parse: aString) fifth
]
