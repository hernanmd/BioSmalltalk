"
Returns UIDs linked to an input set of UIDs in either the same or a different Entrez database

Returns UIDs linked to other UIDs in the same Entrez database that match an Entrez query

Checks for the existence of Entrez links for a set of UIDs within the same database

Lists the available links for a UID

Lists LinkOut URLs and attributes for a set of UIDs

Lists hyperlinks to primary LinkOut providers for a set of UIDs

Creates hyperlinks to the primary LinkOut provider for a single UID

"
Class {
	#name : #BioELink,
	#superclass : #BioEWebEnvCmd,
	#category : 'BioEntrez-Commands'
}

{ #category : #'accessing private' }
BioELink class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ 'elink.fcgi'
]

{ #category : #testing }
BioELink class >> validParameters [
	" Private - See superimplementor´s comment "
	
	^ super validParameters , #('retmode' 'dbfrom' 'cmd' 'db' 'term' 'rel' 'reldate' 'mindate' 'datetype' 'versions')
]
