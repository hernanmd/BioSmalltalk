Class {
	#name : #BioEntrezXMLGenSetParser,
	#superclass : #BioEntrezResultParser,
	#instVars : [
		'eRecord'
	],
	#category : 'BioParsers-Core'
}

{ #category : #accessing }
BioEntrezXMLGenSetParser >> characters: aString [
	" See superimplementor´s comment "

	catchNodes
		ifFalse: [ ^ self ].
	self saveERecordValue: aString.
	self catchOff

		


]

{ #category : #accessing }
BioEntrezXMLGenSetParser >> defaultNodes [
	" Add node names in your specific subclasses. Answer a Collection of Strings
	corresponding with the XML's DTD with the node names in which we are interested "
	
	^ #(
	'SubSource_name'
	'Gene-commentary_heading'
	'Gene-commentary_type'
	'Seq-interval_from'
	'Seq-interval_to' )
]

{ #category : #accessing }
BioEntrezXMLGenSetParser >> eRecord [
	^ eRecord
		ifNil: [ eRecord := Dictionary new ]
]

{ #category : #accessing }
BioEntrezXMLGenSetParser >> eRecord: anObject [
	eRecord := anObject
]

{ #category : #accessing }
BioEntrezXMLGenSetParser >> endElement: elementName [

	^ elementName = 'Entrezgene'
]

{ #category : #accessing }
BioEntrezXMLGenSetParser >> saveERecordValue: aString [

	self eRecord at: current put: aString
]
