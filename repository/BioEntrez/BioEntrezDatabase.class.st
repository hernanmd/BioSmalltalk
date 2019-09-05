"
Abstract superclass for the NCBI Entrez system databases.

Query qualifiers taken from: https://www.ncbi.nlm.nih.gov/books/NBK49540/

"
Class {
	#name : #BioEntrezDatabase,
	#superclass : #BioDBObject,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezDatabase class >> databaseNames [
	" See superimplementor's comment "
	
	^ Array with: self dbName

]

{ #category : #accessing }
BioEntrezDatabase class >> dbClassOf: aString [
	" Answer the corresponding class of aString database name "

	^ self allFinalClasses 
		detect: [ : cls | cls databaseNames includes: aString ]
		ifNone: [ self signalNotFound: 'Database name not found: ' , aString ]
]

{ #category : #'accessing private' }
BioEntrezDatabase >> idCollectionClass [

	^ BioEntrezUIDCollection 
]

{ #category : #testing }
BioEntrezDatabase >> isFetchDatabase [

	^ false
]

{ #category : #accessing }
BioEntrezDatabase >> isIdentifier: aString [

	"self needsWork."
	^ false
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForAccession [
	" Answer a <String> qualifier. Contains the unique accession number of the sequence or record, assigned to the nucleotide, protein, structure, genome record, or PopSet by a sequence database builder. The Structure database accession index contains the PDB IDs but not the MMDB IDs "

	^ '[ACCN]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForAllFields [
	" Answer a <String> qualifier. Contains all terms from all searchable database fields in the database. "

	^ '[ALL]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForAuthorName [
	" Answer a <String> qualifier. Contains all authors from all references in the database records. The format is last name space first initial(s), without punctuation (e.g., marley jf). "

	^ '[AUTH]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForECRNNumber [
	" Answer a <String> qualifier. Number assigned by the Enzyme Commission or Chemical Abstract Service (CAS) to designate a particular enzyme or chemical, respectively. "

	^ '[ECNO]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForFeatureKey [
	" Answer a <String> qualifier. Contains the biological features assigned or annotated to the nucleotide sequences and defined in the DDBJ/EMBL/GenBank Feature Table (http://www.ncbi.nlm.nih.gov/projects/collab/FT/index.html). Not available for the Protein or Structure databases. "

	^ '[FKEY]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForFilter [
	" Answer a <String> qualifier. Contains predetermined or filtered subsets of the various databases. These subsets or filters are created by grouping records that are commonly linked to other Entrez databases or within the same database.

For example, the PopSet database Filter index includes PopSet all, PopSet medline, PopSet nucleotide, and PopSet protein. The PopSet medline filter includes all PopSet records with links to PubMed; the PopSet nucleotide filter includes all PopSet records with links to the nucleotide database; and, the PopSet protein filter includes all PopSet records with links to the protein database. The PopSet all filter includes all PopSet records.

The Nucleotide database Filter index contains a great deal more filters because the database records are linked to numerous external links"

	^ '[FILT]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForGene [
	" Answer a <String> qualifier. Contains the standard and common names of genes found in the database records. This field is not available in Structure database. "

	^ '[GENE]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForGenomeProject [
	" Answer a <String> qualifier for querying the numeric unique identifier for the genome project that produced the sequence records"

	^ '[Genome Project]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForIssue [
	" Answer a <String> qualifier to search issue number of the journal in which the data were published "

	^ '[ISS]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForJournal [
	" Answer a <String> qualifier. Contains the name of the journal in which the data were published. Journal names are indexed in the database in abbreviated form (e.g., J Biol Chem). Journals are also indexed by their by ISSNs. Browse the index if you do not know the ISSN or are not sure how a particular journal name is abbreviated "

	^ '[JOUR]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForKeyword [
	" Answer a <String> qualifier. Contains special index terms from the controlled vocabularies associated with the GenBank, EMBL, DDBJ, SWISS-Prot, PIR, PRF, or PDB databases. Browse the Keyword indexes of the individual databases to become familiar with these vocabularies. A Keyword index is not available in the Structure database. "

	^ '[KYWD]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForModificationDate [
	" Answer a <String> qualifier. The date of most recent modification of a sequence record. The date format is YYYY/MM/DD. Only the year is required. The Modification Date is often used as a range of dates. The colon ( : ) separates the beginning and end of a date range. "

	^ '[MDAT]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForMolecularWeight [
	" Answer a <String> qualifier. Molecular weight of a protein, in Daltons (Da), calculated by the method described in the Searching by Molecular Weight section of the Entrez help document. Note that molecular weight must be entered as a fixed 6 digit field, filled with leading zeros (not letter O), e.g., 002002 [MOLWT] "

	^ '[MOLWT]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForOrganism [
	" Answer a <String> qualifier to search organism in Entrez "

	^ '[ORGN]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForPageNumber [
	" Answer a <String> qualifier. Contains the number of the first journal page of the article in which the data were published."

	^ '[PAGE]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForPrimaryAccession [
	" Answer a <String> qualifier. Contains the primary accession number of the sequence or record, assigned to the nucleotide, protein, structure, genome record, or PopSet by a sequence database builder. A Primary Accession index is not available in the Structure database."

	^ '[PACC]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForPrimaryOrganism [
	" Answer a <String> qualifier. The primary organism when there is more than one source organism."

	^ '[PORGN]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForProperties [
	" Answer a <String> qualifier. Contains properties of the nucleotide or protein sequence. For example, the Nucleotide database's Properties index includes molecule types, publication status, molecule locations, and GenBank divisions. A Properties index is not available in the Structure database."

	^ '[PROP]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForProteinName [
	" Answer a <String> qualifier. Contains the standard names of proteins found in database records. Common names may not be indexed in this field so it is best to also consider All Fields or Text Words. A Protein Name index is not available in the Structure database. "

	^ '[PROT]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForPublicationDate [
	" Answer a <String> qualifier. Contains the date that records are released into Entrez, in the format YYYY/MM/DD (e.g., 1999/08/05). It is the date the entry first appeared in GenBank explicitly indexed in Entrez. A year alone, (e.g., 1999) will retrieve all records for that year; a year and month (e.g., 1999/03) will retrieve all records released into GenBank for that month. "

	^ '[PDAT]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForSeqIDString [
	" Answer a <String> qualifier. Contains the special string identifier, similar to a FASTA identifier, for a given sequence. A SeqID String index is not available in the Structure database. "

	^ '[SQID]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForSeqLength [
	" Answer a <String> qualifier. Contains the total length of the sequence. Sequence Length indexes are not available in the Structure or PopSet databases. "

	^ '[SLEN]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForSubstanceName [
	" Answer a <String> qualifier. Contains the names of any chemicals associated with this record from the CAS registry and the MEDLINE Name of Substance field. Substance Name indexes are not available in the Genome or PopSet databases. "

	^ '[SUBS]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForTextWord [
	" Answer a <String> qualifier. Contains all of the 'free text' associated with a record. "

	^ '[WORD]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForTitleWord [
	" Answer a <String> qualifier. Includes only those words found in the definition line of a record. The definition line summarizes the biology of the sequence and is carefully constructed by database staff. A standard definition line will include the organism, product name, gene symbol, molecule type and whether it is a partial or complete cds. Title Word indexes are not available in the Structure or PopSet databases. "

	^ '[TITL]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForUID [
	" Answer a <String> qualifier. Contains the Medline unique identifier for records that contain published references that are linked to PubMed. The Uid index is not browsable. "

	^ '[UID]'
]

{ #category : #'accessing - qualifiers' }
BioEntrezDatabase >> qualifierForVolume [
	" Answer a <String> qualifier. Contains the volume number of the journal in which the data were published. "

	^ '[VOL]'
]

{ #category : #accessing }
BioEntrezDatabase >> query: aString [
	" Set the client query accordingly to aString "
	
	(self isIdentifier: aString)
		ifFalse: [ self term: aString ]
		ifTrue: [ self uids: (Array with: aString) ]
]

{ #category : #'accessing - organism qualifiers' }
BioEntrezDatabase >> queryArabidopsisThaliana [
	" Answer a <String> to search specific organism in Entrez "

	^ 'Arabidopsis thaliana' , self qualifierForOrganism
]

{ #category : #'accessing - organism qualifiers' }
BioEntrezDatabase >> queryBosTaurus [
	" Answer a <String> to search Bos Taurus organism in Entrez "

	^ 'bos+taurus' , self qualifierForOrganism
]

{ #category : #'accessing public' }
BioEntrezDatabase >> queryGeneNamed: aGeneName [
	" Answer a <String> to search specific organism in Entrez "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aGeneName; 
			space;
			nextPutAll: self qualifierForGene ]
]

{ #category : #'accessing public' }
BioEntrezDatabase >> queryGenomeProjectNumber: aNumber [
	" Answer a <String> to search the numeric unique identifier for the genome project that produced the sequence records "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aNumber asString; 
			space;
			nextPutAll: self qualifierForGenomeProject ]
]

{ #category : #'accessing - organism qualifiers' }
BioEntrezDatabase >> queryHuman [
	" Answer a <String> to search specific organism in Entrez "

	^ 'human' , self qualifierForOrganism
]

{ #category : #'accessing public' }
BioEntrezDatabase >> queryModificationDate: aDate [
	" Answer a <String> with the date of most recent modification of a sequence record. The date format is YYYY/MM/DD. Only the year is required. The Modification Date is often used as a range of dates. The colon ( : ) separates the beginning and end of a date range "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aDate asEntrezDateString; 
			space;
			nextPutAll: self qualifierForModificationDate ]
]

{ #category : #'accessing public' }
BioEntrezDatabase >> queryMolecularWeight: aNumberOrInterval [
	" Answer a <String> to search the molecular weight in Daltons of the protein chain calculated from the amino acids only. This may not correspond to the molecular weight of the protein obtained from biological samples because of incomplete data or post-translational modifications of the protein in living systems. The colon ( : ) separates the beginning and end of a molecular weight range in Entrez "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: aNumberOrInterval asEntrezMWString; 
			space;
			nextPutAll: self qualifierForGene ]
]

{ #category : #'accessing - organism qualifiers' }
BioEntrezDatabase >> queryMusMusculus [
	" Answer a <String> to search specific organism in Entrez "

	^ 'Mus musculus' , self qualifierForOrganism
]

{ #category : #'accessing - organism qualifiers' }
BioEntrezDatabase >> queryRattusNorvegicus [
	" Answer a <String> to search specific organism in Entrez "

	^ 'Rattus norvegicus' , self qualifierForOrganism
]

{ #category : #accessing }
BioEntrezDatabase >> retMax: aNumber [
	" Set the receiver's number of records to be retrieved to aNumber "
	
	self client queryAt: 'retmax' put: aNumber asString
]

{ #category : #accessing }
BioEntrezDatabase >> setUseHistory [
	" Private - See the client's comment "
	
	self client setUseHistory
]

{ #category : #actions }
BioEntrezDatabase >> spell [
	" Private - See client's implementation "
	
	^ self client spell
]

{ #category : #'accessing public' }
BioEntrezDatabase >> term: aString [
	" Set the receiver's search term to aString "
	
	self client queryAt: 'term' put: aString
]

{ #category : #accessing }
BioEntrezDatabase >> uids: aCollection [
	" Set the client's identifiers list to aCollection "
	
	self client 
		queryAt: 'id' 
		put: (self idCollectionClass withAll: aCollection) baseUrl
]

{ #category : #accessing }
BioEntrezDatabase >> useWebEnv [
	" Private - See the client's comment "
	
	^ self client useWebEnv
]

{ #category : #accessing }
BioEntrezDatabase >> valueForParameter: aString [
	" Answer the configured value for the parameter name aString "
	
	^ self client url valueForParameter: aString
]

{ #category : #accessing }
BioEntrezDatabase >> webEnv: aGTESearchResult [
	" Private - See the client's comment "
	
	self client webEnv: aGTESearchResult
]
