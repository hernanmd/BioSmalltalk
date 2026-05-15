"
Formatter for GenBank flat-file output. Extends BioFileFormatter to produce GenBank-format sequence records.
"
Class {
	#name : 'BioFlatGenBankFormatter',
	#superclass : 'BioFileFormatter',
	#category : 'BioFormatters-Formatters',
	#package : 'BioFormatters',
	#tag : 'Formatters'
}

{ #category : 'accessing' }
BioFlatGenBankFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'GenBank Writer'
]

{ #category : 'accessing' }
BioFlatGenBankFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'gb'
]

{ #category : 'accessing' }
BioFlatGenBankFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('GenBank')
]

{ #category : 'accessing' }
BioFlatGenBankFormatter >> fileNamePrefix [
	" Answer a String for prefixing the output file name "
	
	^ 'BioST-Exported-GenBank_'
]
