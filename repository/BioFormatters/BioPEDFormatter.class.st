"
http://pngu.mgh.harvard.edu/~purcell/plink/data.shtml#ped
"
Class {
	#name : #BioPEDFormatter,
	#superclass : #BioFileFormatter,
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioPEDFormatter class >> description [
	" Private - See superimplementor's comment "

	^ 'PED Writer'
]

{ #category : #accessing }
BioPEDFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'ped'

]

{ #category : #accessing }
BioPEDFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('PED')
]
