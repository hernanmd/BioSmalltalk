"
This is a basic parser which can parse accession, definition and sequence nodes from each GBSeq.
"
Class {
	#name : #BioEntrezXMLGBBasicParser,
	#superclass : #BioEntrezXMLGenBankSeqParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioEntrezXMLGBBasicParser class >> parserNodes [
	" See superimplementor's comment "

	^ { #qualifierForAccessionWithVersion .
	#qualifierForAuthor .
	#qualifierForDefinition .
	#qualifierForReferenceJournal } collect: [ : selector | BioGBSeqCollection perform: selector ]

]

{ #category : #accessing }
BioEntrezXMLGBBasicParser >> defaultNodes [
	" Add node names in your specific subclasses. Answer a Collection of Strings
	corresponding with the XML's DTD with the node names in which we are interested "

	^ super defaultNodes , self parserNodes
]

{ #category : #accessing }
BioEntrezXMLGBBasicParser >> endElement: elementName [

	( super endElement: elementName )
		ifTrue: [ self results add: self eRecord. ]
]
