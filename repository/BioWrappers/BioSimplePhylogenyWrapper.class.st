"
I am a wrapper for the Simple Phylogeny tool (ClustalW2-based tree generation).

Simple Phylogeny provides access to phylogenetic tree generation methods including Neighbour-Joining and UGMA clustering, with options for distance correction, gap exclusion, and output format selection.

Usage:
| wrapper |
wrapper := BioSimplePhylogenyWrapper new.
wrapper input: aligned.fasta.
wrapper clusteringMethodNJ.
wrapper treeFormatPhylip.
wrapper distanceCorrectionOn.
wrapper execute.
"
Class {
	#name : 'BioSimplePhylogenyWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Phylogeny',
	#package : 'BioWrappers',
	#tag : 'Phylogeny'
}

{ #category : 'accessing' }
BioSimplePhylogenyWrapper class >> category [

	^ 'Phylogeny'
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> clusteringMethodNJ [

	^ self propertyAt: 'clustering' ifAbsentPut: [ 'nj' ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> clusteringMethodUPGMA [

	^ self propertyAt: 'clustering' ifAbsentPut: [ 'upgma' ]
]

{ #category : 'defaults' }
BioSimplePhylogenyWrapper >> defaultProgramName [

	^ self execNameFor: 'clustalw2'
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> distanceCorrectionOff [

	^ self propertyAt: 'kimura' ifAbsentPut: [ false ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> distanceCorrectionOn [

	^ self propertyAt: 'kimura' ifAbsentPut: [ true ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> excludeGapsOn [

	^ self addOption: 'kickstragglers'
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> input: aFilename [

	^ self
		  propertyAt: 'infile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> out: aFilename [

	^ self
		  propertyAt: 'outfile'
		  ifAbsentPut: [ self buildPath: aFilename ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> percentIdentityMatrix [

	^ self addOption: 'percent'
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> quickTree [

	^ self addOption: 'quicktree'
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> treeFormatClustal [

	^ self propertyAt: 'treeformat' ifAbsentPut: [ 'clustal' ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> treeFormatDistMatrix [

	^ self propertyAt: 'treeformat' ifAbsentPut: [ 'dist' ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> treeFormatNexus [

	^ self propertyAt: 'treeformat' ifAbsentPut: [ 'nexus' ]
]

{ #category : 'parameters' }
BioSimplePhylogenyWrapper >> treeFormatPhylip [

	^ self propertyAt: 'treeformat' ifAbsentPut: [ 'phylip' ]
]
