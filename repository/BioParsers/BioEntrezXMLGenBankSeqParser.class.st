"
This parser checks nodes containing keyword ""GBSeq"". When found a new entrez record (eRecord) is added to the results Collection. If not found it means GBSeq is an element container, so record values are set in the current eRecord (#saveERecordValue:)
"
Class {
	#name : #BioEntrezXMLGenBankSeqParser,
	#superclass : #BioEntrezResultParser,
	#instVars : [
		'eRecord'
	],
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> characters: arg1 [
	catchNodes
		ifTrue: [ self newERecordValue: arg1 ].
	self catchOff
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> defaultNodes [
	" Add node names in your specific subclasses. Answer a Collection of Strings
	corresponding with the XML's DTD with the node names in which we are interested "
	
	^ #(
	" To distinguish a new record "
	'GBSeq'
	
	" Sample node names 
	'GBSeq_primary-accession'
	'GBSeq_accession-version'
	
	'GBSeq_sequence' " )
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> eRecord [
	^ eRecord
		ifNil: [ eRecord := self entrezRecordClass new ]
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> eRecord: anObject [
	eRecord := anObject
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> endElement: elementName [

	^ elementName = 'GBSet'
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> entrezRecordClass [

	^ Dictionary
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> newERecordValue: aString [
	" Private - Save current node with value aString in the receiver's current entrez record entry "
	
	current = 'GBSeq'
		ifFalse: [ self saveERecordValue: aString ]
		ifTrue: [
			self eRecord isEmpty
				ifFalse: [ 
					self results add: self eRecord.
					self eRecord: self entrezRecordClass new  ] ]
]

{ #category : #accessing }
BioEntrezXMLGenBankSeqParser >> saveERecordValue: aString [
	" Private - Save current node with value aString in the receiver's current entrez record entry "
	
	self eRecord at: current put: aString
]
