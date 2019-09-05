"
Feature qualifiers parser. Disambiguates for example, the following subtree:

      <GBFeature_quals>
        <GBQualifier>
          <GBQualifier_name>organism</GBQualifier_name>
          <GBQualifier_value>Bos taurus</GBQualifier_value>
        </GBQualifier>
        <GBQualifier>
          <GBQualifier_name>organelle</GBQualifier_name>
          <GBQualifier_value>mitochondrion</GBQualifier_value>
        </GBQualifier>
        <GBQualifier>
          <GBQualifier_name>mol_type</GBQualifier_name>
          <GBQualifier_value>genomic DNA</GBQualifier_value>
        </GBQualifier>
        <GBQualifier>
          <GBQualifier_name>isolate</GBQualifier_name>
          <GBQualifier_value>BU19</GBQualifier_value>
        </GBQualifier>
        <GBQualifier>
          <GBQualifier_name>db_xref</GBQualifier_name>
          <GBQualifier_value>taxon:9913</GBQualifier_value>
        </GBQualifier>
        <GBQualifier>
          <GBQualifier_name>breed</GBQualifier_name>
          <GBQualifier_value>Busha cattle</GBQualifier_value>
        </GBQualifier>
      </GBFeature_quals>

Usage example:

| fileRef |
fileRef := BioObject testFilesFullDirectoryName / 'GenBankTestFiles' / 'TestGBSeq02.xml'.
(BioEntrezXMLGBSeqFeatureQualParser on: fileRef readStream) collectGBSet

"
Class {
	#name : #BioEntrezXMLGBSeqFeatureQualParser,
	#superclass : #BioEntrezXMLGBSeqParser,
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioEntrezXMLGBSeqFeatureQualParser class >> defaultNodes [

	^ #(
	'GBSeq_accession-version'
	
	'GBAuthor' 
	'GBReference_title' 
	'GBReference_journal' 
	'GBXref_id' 

	'GBQualifier_name' 
	'GBQualifier_value' )
]

{ #category : #private }
BioEntrezXMLGBSeqFeatureQualParser >> saveGBNode: result [
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
