"
sp|accesion|entry

"
Class {
	#name : #BioSwissProtParser,
	#superclass : #BioAccessionParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioSwissProtParser class >> identifier [
	" See superimplementor's comment "

	^ 'sp'
]

{ #category : #'initialize-release' }
BioSwissProtParser >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self identifier asParser , 
		self parserForAccession ,
		(self parserForEntry ==> [: r | r allButFirst ]).
]

{ #category : #accessing }
BioSwissProtParser >> parserForEntry [
	" Answer a parser for parsing entry identifiers "

	^ (#letter asParser / 
		#digit asParser / 
		#punctuation asParser) plus flatten.	


]

{ #category : #accessing }
BioSwissProtParser >> tokenizeSwissProtEntryName [
	" Extract the Swiss-Prot entry name from aString "
	
	^ (self expression findTokens: '|') third
]

{ #category : #accessing }
BioSwissProtParser >> tokenizeSwissProtEntryName: aString [
	" Extract the Swiss-Prot entry name from aString "
	
	^ self class tokenizeSwissProtEntryName: aString
]
