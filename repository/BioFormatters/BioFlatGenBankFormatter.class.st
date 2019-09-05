Class {
	#name : #BioFlatGenBankFormatter,
	#superclass : #BioFileFormatter,
	#category : 'BioFormatters-Formatters'
}

{ #category : #accessing }
BioFlatGenBankFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'GenBank Writer'
]

{ #category : #accessing }
BioFlatGenBankFormatter class >> formatExtension [
	" Private - Answer a String corresponding for the receiver's file output format "

	^ 'gb'
]

{ #category : #accessing }
BioFlatGenBankFormatter class >> identifiers [
	" Answer a Collection of identifiers of the receiver "
	
	^ #('GenBank')
]

{ #category : #accessing }
BioFlatGenBankFormatter >> fileNamePrefix [
	" Answer a String for prefixing the output file name "
	
	^ 'BioST-Exported-GenBank_'
]
