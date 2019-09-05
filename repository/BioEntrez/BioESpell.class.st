"
Provides spelling suggestions for terms within a single text query in a given database.

http://eutils.ncbi.nlm.nih.gov/entrez/eutils/espell.fcgi?db=pubmed&term=brest+cancer

http://www.ncbi.nlm.nih.gov/corehtml/query/static/espell_help.html
"
Class {
	#name : #BioESpell,
	#superclass : #BioEntrezCommand,
	#category : 'BioEntrez-Commands'
}

{ #category : #'accessing private' }
BioESpell class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'espell.fcgi'
]

{ #category : #testing }
BioESpell class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('db' 'term')
]
