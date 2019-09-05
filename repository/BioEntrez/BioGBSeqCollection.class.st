"
BioGBSeqCollection is a <Collection> of <Dictionary> which serves to access GenBank related information.

"
Class {
	#name : #BioGBSeqCollection,
	#superclass : #BioINSDCCollection,
	#category : 'BioEntrez-Core'
}

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAccessionWithVersion [

	^ 'GBSeq_accession-version'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAlignedSequence [
	" Note : This qualifier does not exists in the GenBank feature tables. It was added to support records with aligned sequences "

	^ 'GBSeq_aligned-sequence'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForAuthor [

	^ 'GBAuthor'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForDefinition [

	^ 'GBSeq_definition'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForReferenceJournal [

	^ 'GBReference_journal'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForReferenceTitle [

	^ 'GBReference_title'
]

{ #category : #accessing }
BioGBSeqCollection class >> qualifierForXRefId [

	^ 'GBXref_id'
]

{ #category : #accessing }
BioGBSeqCollection class >> readerClass [ 
	" Private - See superimplementor's comment "

	^ BioEXmlGBSeqReader
]

{ #category : #accessing }
BioGBSeqCollection >> accessionsWithVersion [

	^ self collect: [ : d | d at: self class qualifierForAccessionWithVersion ]
]

{ #category : #accessing }
BioGBSeqCollection >> atAccession: accesionString [
	" Answer a <Dictionary> identified by accessionString "

	^ self detect: [ : d | (d at: self class qualifierForAccessionWithVersion) = accesionString ]
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
	
	^ (self detectMax: [ : d | d value size ]) features asSortedCollection
	
]
