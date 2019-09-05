"
Nexus file format (usually .nex or .nxs) is widely used in Bioinformatics. Several popular phylogenetic programs such as Paup, MrBayes, Mesquite, and MacClade use this format.

Implementation is incomplete.
"
Class {
	#name : #BioNexusFile,
	#superclass : #BioFile,
	#instVars : [
		'blocks'
	],
	#category : 'BioPhylogenetics-Files'
}

{ #category : #accessing }
BioNexusFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: 'Nexus'
]

{ #category : #examples }
BioNexusFile class >> simpleDNAAlignment [

	^ '#NEXUS
Begin data;
Dimensions ntax=4 nchar=15;
Format datatype=dna missing=? gap=-;
Matrix
Species1   atgctagctagctcg
Species2   atgcta??tag-tag
Species3   atgttagctag-tgg
Species4   atgttagctag-tag           
;
End;'
]

{ #category : #accessing }
BioNexusFile >> blocks [
	" Answer a <Collection> of <BioNexusBlock> in the receiver "
	
	^ blocks
]

{ #category : #accessing }
BioNexusFile >> blocksAt: aString [
	" Answer a <Collection> of blocks in the receiver for which the name equals aString "
	
	^ self blocks select: [ : blk | blk name = aString ]
]

{ #category : #accessing }
BioNexusFile >> characterBlocks [
	" Answer a <Collection> of character blocks in the receiver "
	
	^ self blocks select: #isNexusCharacterBlock
]

{ #category : #accessing }
BioNexusFile >> dataBlocks [
	" Answer a <Collection> of data blocks in the receiver "
	
	^ self blocks select: #isNexusDataBlock
]

{ #category : #accessing }
BioNexusFile >> distancesBlocks [
	" Answer a <Collection> of distances blocks in the receiver "
	
	^ self blocks select: #isNexusDistancesBlock
]

{ #category : #accessing }
BioNexusFile >> taxaBlocks [
	" Answer a <Collection> of taxa blocks in the receiver "
	
	^ self blocks select: #isNexusTaxaBlock
]

{ #category : #accessing }
BioNexusFile >> treesBlocks [
	" Answer a <Collection> of trees blocks in the receiver "
	
	^ self blocks select: #isNexusTreesBlock
]
