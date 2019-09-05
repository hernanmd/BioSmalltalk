"
Abstract XML Pull Parser for http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.dtd

  GBSeq represents the elements in a GenBank style report
    of a sequence with some small additions to structure and support
    for protein (GenPept) versions of GenBank format as seen in
    Entrez. While this represents the simplification, reduction of
    detail, and flattening to a single sequence perspective of GenBank
    format (compared with the full ASN.1 or XML from which GenBank and
    this format is derived at NCBI), it is presented in ASN.1 or XML for
    automated parsing and processing. It is hoped that this compromise
    will be useful for those bulk processing at the GenBank format level
    of detail today. Since it is a compromise, a number of pragmatic
    decisions have been made.

See http://www.ncbi.nlm.nih.gov/dtd/NCBI_GBSeq.mod.dtd for details



"
Class {
	#name : #BioEntrezXMLGBSeqParser,
	#superclass : #BioXMLParser,
	#instVars : [
		'matches',
		'records'
	],
	#category : 'BioParsers-XML'
}

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> collectGBSet [
	" Parse the receiver expression and answer a <Collection> of resulting nodes "

	parser := XMLPullParser parse: self expression.
	parser reset.
	[ parser isEndDocument ] whileFalse: [
		parser if: 'GBSeq' peek: [ self saveGBSeq ].
		(parser nodesIfAny: self selectedNodes) ifNotEmptyDo: [ : result | self saveGBNode: result ].
		parser next ].
	(parser isEndDocument and: [ matches notNil ])
		ifTrue: [ self saveGBSeq ].
	^ self results.
]

{ #category : #private }
BioEntrezXMLGBSeqParser >> defaultFormatterClass [

	^ BioXMLOrderedCollection
]

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> defaultMatchesClass [

	^ Dictionary
]

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> matches [
	^ matches
		ifNil: [ matches := self defaultMatchesClass new ]
]

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> matches: anObject [
	matches := anObject
]

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> parse [
	" Parse the receiver expression and answer a <Collection> of resulting nodes "

	^ self collectGBSet
]

{ #category : #accessing }
BioEntrezXMLGBSeqParser >> records [

	^ records
		ifNil: [ records := OrderedCollection new ]
]

{ #category : #private }
BioEntrezXMLGBSeqParser >> saveGBSeq [
	" Private - Save matched nodes into receiver's results. Usually this operation implies a new record subtree has been found "

	self matches notEmpty
		ifTrue: [ 
			self results add: (BioGenBankRecord new properties: matches).
			self matches: nil. ]

]
