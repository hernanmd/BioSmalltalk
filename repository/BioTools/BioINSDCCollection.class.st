"
Includes The DDBJ/EMBL/GenBank Feature Table definitions

"
Class {
	#name : #BioINSDCCollection,
	#superclass : #BioReadersCollection,
	#category : #'BioTools-Collections'
}

{ #category : #accessing }
BioINSDCCollection class >> qualifierForDBXRef [
	" Database cross-reference: pointer to related information in another database.  
	Details : http://www.ebi.ac.uk/ena/WebFeat/qualifiers/db_xref.html "

	^ 'db_xref'
]

{ #category : #accessing }
BioINSDCCollection class >> qualifierForIsolate [
	" individual isolate from which the sequence was obtained
	Details : http://www.insdc.org/files/feature_table.html "

	^ 'isolate'
]

{ #category : #accessing }
BioINSDCCollection class >> qualifierForMolType [
	" in vivo molecule type of sequence  
	Details : http://www.insdc.org/files/feature_table.html "

	^ 'mol_type'
]

{ #category : #accessing }
BioINSDCCollection class >> qualifierForOrganelle [
	" type of membrane-bound intracellular structure from which the sequence was obtained
	Details : http://www.insdc.org/files/feature_table.html "

	^ 'organelle'
]

{ #category : #accessing }
BioINSDCCollection class >> qualifierForOrganism [
	" scientific name of the organism that provided the sequenced genetic material
	Details : http://www.insdc.org/files/feature_table.html "

	^ 'organism'
]
