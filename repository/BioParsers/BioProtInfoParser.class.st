"
pir||entry

"
Class {
	#name : 'BioProtInfoParser',
	#superclass : 'BioNCBIIdParser',
	#category : 'BioParsers-Core',
	#package : 'BioParsers',
	#tag : 'Core'
}

{ #category : 'accessing' }
BioProtInfoParser class >> identifier [
	" See superimplementor's comment "

	^ 'pir|'
]

{ #category : 'initialize-release' }
BioProtInfoParser >> entryParser [
	" Answer a parser for parsing entry identifiers "

	^ self parserForNonFastaString
]

{ #category : 'initialize-release' }
BioProtInfoParser >> initialize [

	super initialize.	
	parser := 
		self parserForIdentifier ==> [: r | r allButLast ] , 
		self entryParser.
]
