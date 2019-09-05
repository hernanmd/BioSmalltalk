"
The Database class represent the source database for genes, proteins or transcripts. 

"
Class {
	#name : #BioOrthoDatabase,
	#superclass : #Object,
	#category : 'BioOrthoXML-Core'
}

{ #category : #comparing }
BioOrthoDatabase >> = aBioOrthoDatabase [
]

{ #category : #accessing }
BioOrthoDatabase >> geneLink [
	" Returns a <String> with the link to the gene in the database how this link is create is source specific. "
	
]

{ #category : #accessing }
BioOrthoDatabase >> geneLink: aString [
	" Set aString with the link to the gene in the database how this link is create is source specific. "
	
]

{ #category : #private }
BioOrthoDatabase >> hash [

]

{ #category : #accessing }
BioOrthoDatabase >> protLink [
	" Answer the link to the protein in the database how this link is create is source specific. "
]

{ #category : #accessing }
BioOrthoDatabase >> protLink: aString [
	" Set aString with the link to the protein in the database how this link is create is source specific. "
]

{ #category : #accessing }
BioOrthoDatabase >> transcriptLink [
	" Answer a <String> with the link to the transcript in the database how this link is create is source specific. "
]

{ #category : #accessing }
BioOrthoDatabase >> transcriptLink: aString [
	" Set aString with the link to the transcript in the database how this link is create is source specific. "
]

{ #category : #accessing }
BioOrthoDatabase >> version [
	" Answer a <String> with the version the database. "
]
