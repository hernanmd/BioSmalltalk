"
I extract BioPhyloTree objects from the TREES blocks of a BioNexusFile (Nexus format). Each 'tree name = newick ;' line is parsed as a BioPhyloTree.

  trees := BioPhyloNexusReader treesFrom: aBioNexusFile.

Only the TREES block is handled here; other Nexus block types (CHARACTERS, DATA, DISTANCES, TAXA) are handled by BioNexusFile itself.
"
Class {
	#name : 'BioPhyloNexusReader',
	#superclass : 'Object',
	#category : 'BioPhylogenetics-IO',
	#package : 'BioPhylogenetics',
	#tag : 'IO'
}

{ #category : 'reading' }
BioPhyloNexusReader class >> treesFrom: aBioNexusFile [

	^ self new treesFrom: aBioNexusFile
]

{ #category : 'reading' }
BioPhyloNexusReader >> extractNewickFromTreeLine: aLine [
	"Return the newick substring following the first '=' in a TREE line."
	| idx |
	idx := aLine indexOf: $=.
	idx = 0 ifTrue: [ ^ '' ].
	^ (aLine copyFrom: idx + 1 to: aLine size) trimBoth
]

{ #category : 'reading' }
BioPhyloNexusReader >> newickStringsFromTreesBlock: aBlock [
	| contents lines newicks |
	contents := aBlock contents ifNil: [ ^ #() ].
	lines := contents lines.
	newicks := OrderedCollection new.
	lines do: [ :line | | trimmed |
		trimmed := line trimBoth.
		(trimmed asLowercase beginsWith: 'tree') ifTrue: [
			newicks add: (self extractNewickFromTreeLine: trimmed) ] ].
	^ newicks
]

{ #category : 'reading' }
BioPhyloNexusReader >> treesFrom: aBioNexusFile [
	"Answer an OrderedCollection of BioPhyloTree parsed from the TREES blocks."
	| trees |
	trees := OrderedCollection new.
	aBioNexusFile treesBlocks do: [ :block |
		(self newickStringsFromTreesBlock: block) do: [ :newick | trees add: (BioPhyloTree readFromNewick: newick) ] ].
	^ trees
]
