Class {
	#name : #BioEntrezXMLGBFullParser,
	#superclass : #BioEntrezXMLGenBankSeqParser,
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioEntrezXMLGBFullParser class >> parserNodes [
	" See superimplementor's comment "

	^ #('GBSeq_locus' 'GBSeq_length' 'GBSeq_strandedness' 'GBSeq_moltype' 'GBSeq_topology' 'GBSeq_division' 'GBSeq_update-date' 'GBSeq_definition' 'GBSeq_accession-version' 'GBSeq_source' 'GBSeq_organism' 'GBSeq_taxonomy' 'GBReference_position' 'GBReference_reference' 'GBSeq_sequence' 'GBAuthor' 'GBReference_title' 'GBReference_journal')
]

{ #category : #accessing }
BioEntrezXMLGBFullParser >> defaultNodes [
	" Add node names in your specific subclasses. Answer a Collection of Strings corresponding with the XML's DTD with the node names in which we are interested "

	^ super defaultNodes , self parserNodes
]

{ #category : #accessing }
BioEntrezXMLGBFullParser >> endElement: elementName [

	( super endElement: elementName )
		ifTrue: [ self results add: self eRecord. ]
]
