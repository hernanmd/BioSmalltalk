"
BioGBSeqCollection is a <Collection> of <Dictionary> which serves to access GenBank related information.

"
Class {
	#name : #BioGBSeqCollection,
	#superclass : #BioINSDCCollection,
	#instVars : [
		'bioGBSeqCollection'
	],
	#category : #'BioEntrez-Core'
}

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAccessionWithVersion [
	"Answer a <String> describing the node used for accession numbers with versions"

	^ 'GBSeq_accession-version'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAlignedSequence [
	" Note : This qualifier does not exists in the GenBank feature tables. It was added to support records with aligned sequences "

	^ 'GBSeq_aligned-sequence'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAuthor [
	"Answer a <String> describing the node used for authors"

	^ 'GBAuthor'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForDefinition [
	"Answer a <String> describing the node used for sequence definition"
	
	^ 'GBSeq_definition'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForReferenceJournal [
	"Answer a <String> describing the node used for reference journals"

	^ 'GBReference_journal'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForReferenceTitle [
	"Answer a <String> describing the node used for reference titles"
	
	^ 'GBReference_title'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForXRefId [

	^ 'GBXref_id'
]

{ #category : #accessing }
BioGBSeqCollection class >> readerClass [ 
	"Private - See superimplementor's comment"

	^ BioEXmlGBSeqReader
]

{ #category : #accessing }
BioGBSeqCollection >> accessionsWithVersion [
	"Answer a <Collection> of <String>"

	^ self collect: [ : d | 
		d at: self class qualifierForAccessionWithVersion ifAbsent: [ String empty ] ]
]

{ #category : #accessing }
BioGBSeqCollection >> atAccession: accesionString [
	"Answer a <Dictionary> identified by accessionString "

	^ self
		detect: [ : d | (d at: self class qualifierForAccessionWithVersion ifAbsent: [ nil ]) = accesionString ]
		
]

{ #category : #accessing }
BioGBSeqCollection >> collectAt: keyName [

	^ self collect: [ : d | d at: keyName ]
]

{ #category : #accessing }
BioGBSeqCollection >> collectAt: keyName ifAbsent: absentBlock [

	^ self collect: [ : d | d at: keyName ifAbsent: absentBlock ]
]

{ #category : #accessing }
BioGBSeqCollection >> features [
	" Detect the record with most features and answer a sorted <Collection> of <String> with them "
	
	^ (self detectMax: [ : d | d value size ])
		ifNil: [ Array empty ]
		ifNotNil: [ : maxCol | maxCol features asSortedCollection ]
	
]
