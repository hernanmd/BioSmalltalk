"
PubMed has been available since 1996. Its more than 25 million references include the MEDLINE database plus the following types of citations:

    In-process citations, which provide records for articles before those records go through quality control and are indexed with MeSH or converted to out-of-scope status.
    Citations to articles that are out-of-scope (e.g., covering plate tectonics or astrophysics) from certain MEDLINE journals, primarily general science and general chemistry journals, for which only the life sciences articles are indexed with MeSH.
    ""Ahead of Print"" citations that precede the article's final publication in a MEDLINE indexed journal.
    Citations that precede the date that a journal was selected for MEDLINE indexing (when supplied electronically by the publisher).
    Pre-1966 citations that have not yet been updated with current MeSH and converted to MEDLINE status.
    Citations to some additional life sciences journals that submit full text to PMC® (PubMed Central®) and receive a qualitative review by NLM.
    Citations to author manuscripts of articles published by NIH-funded researchers.
    Citations for the majority of books available on the NCBI Bookshelf (a citation for the book and in some cases each chapter of the book).

PubMed citations often include links to the full-text article on the publishers' Web sites and/or in PMC and the Bookshelf. MEDLINE is the largest subset of PubMed. You may limit your PubMed search retrieval to MEDLINE citations by restricting your search to the MeSH controlled vocabulary or by using the Journal Categories filter called MEDLINE.

See https://www.nlm.nih.gov/pubs/factsheets/dif_med_pub.html for details.

This class is not intended to be used directly.
See BioEntrezClient.
"
Class {
	#name : #BioEntrezPubMed,
	#superclass : #BioELitDatabase,
	#category : 'BioEntrez-Databases'
}

{ #category : #accessing }
BioEntrezPubMed class >> dbName [
	" See superimplementor's comment "
	
	^ 'pubmed'

]

{ #category : #accessing }
BioEntrezPubMed >> fields [
	" See http://www.ncbi.nlm.nih.gov/corehtml/query/static/esearch_help.html for details "

	^ #( 'affl' 'auth' 'ecno' 'jour' 'iss' 'mesh' 'majr' 'mhda' 'page' 'pdat' 'ptyp' 'si' 'subs' 'subh' 'tiab' 'word' 'titl' 'lang' 'uid' 'fltr' 'vol')
]

{ #category : #accessing }
BioEntrezPubMed >> rettypeFields [
	" See 
	http://www.ncbi.nlm.nih.gov/books/NBK25499/#chapter4.EFetch
	for details "

	^ #( 'uilist' 'abstract' 'citation' 'medline' 'full' )
]
