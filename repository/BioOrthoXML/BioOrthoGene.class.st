"
Represent a gene or better molecule in the context of orthology assignments. Can be identified by a gene, protein and transcript identifier. 

API spec from
http://orthoxml.org/OrthoXML/javaAPI/
"
Class {
	#name : #BioOrthoGene,
	#superclass : #Object,
	#category : 'BioOrthoXML-Core'
}

{ #category : #comparing }
BioOrthoGene >> = aBioOrthoGene [
]

{ #category : #accessing }
BioOrthoGene >> database [
	" Answer a <BioOrthoDatabase> with the database the gene stems from. "
]

{ #category : #accessing }
BioOrthoGene >> database: aBioOrthoDatabase [
	" Set a aBioOrthoDatabase with the database the gene stems from. "
]

{ #category : #accessing }
BioOrthoGene >> geneIdentifier [
	" Answer the gene identifier "
]

{ #category : #accessing }
BioOrthoGene >> geneIdentifier: aString [
	" Set aString with the gene identifier "
]

{ #category : #private }
BioOrthoGene >> hash [
]

{ #category : #accessing }
BioOrthoGene >> proteinIdentifier [
	" Answer the protein identifier "
]

{ #category : #accessing }
BioOrthoGene >> proteinIdentifier: aString [
	" Set aString with the protein identifier "
]

{ #category : #accessing }
BioOrthoGene >> species [
	"  Returns a <BioOrthoSpecies> with the species the gene stems from. "
]

{ #category : #accessing }
BioOrthoGene >> species: aBioOrthoSpecies [
	" Sets the species the gene stems from. "
]

{ #category : #accessing }
BioOrthoGene >> transcriptIdentifier [
	" Answer the transcript identifier "
]
