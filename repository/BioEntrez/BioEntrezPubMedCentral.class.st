"
PMC (PubMed Central) launched in 2000 as a free archive for full-text biomedical and life sciences journal articles. PMC serves as a digital counterpart to the NLM extensive print journal collection; it is a repository for journal literature deposited by participating publishers, as well as for author manuscripts that have been submitted in compliance with the NIH Public Access Policy and similar policies of other research funding agencies. Some PMC journals are also MEDLINE journals,

See https://www.nlm.nih.gov/pubs/factsheets/dif_med_pub.html for details.

This class is not intended to be used directly.
See BioEntrezClient.

License filters are described in : http://www.ncbi.nlm.nih.gov/pmc/tools/openftlist/

"
Class {
	#name : #BioEntrezPubMedCentral,
	#superclass : #BioELitDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezPubMedCentral class >> dbName [
	" See superimplementor's comment "
	
	^ 'pmc'

]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termAnyCCLicense [
	" Any CC license "

	^ self term: 'cc+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCByLicense [
	" CC BY (Attribution) "

	^ self term: 'cc+by+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCByNCLicense [
	" Attribution, noncommercial "

	^ self term: 'cc+by-nc+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCByNCNDLicense [
	" Attribution, noncommercial, no derivatives "

	^ self term:  'cc+by-nc-nd+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCByNCSALicense [
	" Attribution, noncommercial, share-alike "

	^ self term: 'cc+by-nc-sa+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCByNDLicense [
	" Attribution, no derivatives "

	^ self term:  'cc+by-nd+license[filter]'
]

{ #category : #'accessing - filters' }
BioEntrezPubMedCentral >> termCCBySALicense [
	" Public domain "

	^ self term:  'cc0+license[filter]'
]
