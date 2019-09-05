Class {
	#name : #BioEntrezXMLGBSeqFullParser,
	#superclass : #BioEntrezXMLGBSeqParser,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioEntrezXMLGBSeqFullParser class >> defaultNodes [

	^ #(
	'GBSeq_accession-version'
	
	'GBAuthor' 
	'GBReference_title' 
	'GBReference_journal' 
	'GBXref_id' 
	
	'GBFeature_key'
	'GBFeature_location'

	'GBQualifier_name' 
	'GBQualifier_value' )
]

{ #category : #private }
BioEntrezXMLGBSeqFullParser >> saveGBNode: result [
	" Set qualifier name as key and qualifier value as value for a GenBank node.
	If result is not a feature qualifier, then belongs to a 'single tag' value, i.e. GBSeq_locus, GBSeq_length, etc., use the tag name as property key.
	If result is a feature qualifier, i.e. GBQualifier_name & GBQualifier_value, then set the name as property key "

	result first key = 'GBQualifier_name' 
		ifTrue: [ 
			result size = 1 
				ifFalse: [ 
					result first key: result first value.					
					result first value: result second value. 
					result removeLast  ] ].
	self matches add: (BioGenBankAssociation key: result first key value: result first value)
]
