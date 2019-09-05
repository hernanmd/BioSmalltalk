"
This is a parser for NCBI GenInfo identifier syntax. In this parser #parse: aString will answer (extract) the part of aString matching the Gene Identifier number.

gi|integer

"
Class {
	#name : #BioGIParser,
	#superclass : #BioNCBIIdParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioGIParser class >> identifier [
	" See superimplementor's comment "

	^ 'gi|'
]

{ #category : #accessing }
BioGIParser >> buildTokens: aCollection [
	" Answer a Collection object for the receiver's parsing output "

	self results: aCollection second.
	^ self results		
]

{ #category : #accessing }
BioGIParser >> tokenizeGi: aString [
	" Refer to comment in class side "
	
	^ self class tokenizeGi: aString
]
