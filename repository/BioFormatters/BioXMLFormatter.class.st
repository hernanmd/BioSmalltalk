"
Abstract XML file formatter. Extends BioFileFormatter with XML-specific formatting behavior.
"
Class {
	#name : 'BioXMLFormatter',
	#superclass : 'BioFileFormatter',
	#category : 'BioFormatters-Formatters',
	#package : 'BioFormatters',
	#tag : 'Formatters'
}

{ #category : 'accessing' }
BioXMLFormatter class >> description [
	" Answer a Collection of identifiers of the receiver "
	
	^ 'XML Format Writer'
]

{ #category : 'accessing' }
BioXMLFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'xml'
]

{ #category : 'accessing' }
BioXMLFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('XML')
]
