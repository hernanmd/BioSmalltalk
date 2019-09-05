"
Display counts in XML for stem cells in each Entrez database:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/egquery.fcgi?term=stem+cells

Display counts in XML for brca1 or brca2 for each Entrez database:
http://eutils.ncbi.nlm.nih.gov/entrez/eutils/egquery.fcgi?term=brca1+OR+brca2


http://www.ncbi.nlm.nih.gov/corehtml/query/static/egquery_help.html
"
Class {
	#name : #BioEGlobalQuery,
	#superclass : #BioEntrezCommand,
	#category : 'BioEntrez-Commands'
}

{ #category : #accessing }
BioEGlobalQuery class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'egqueryt.fcgi'
]

{ #category : #testing }
BioEGlobalQuery class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('term')
]
