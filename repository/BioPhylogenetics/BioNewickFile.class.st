Class {
	#name : 'BioNewickFile',
	#superclass : 'BioFile',
	#category : 'BioPhylogenetics-Files',
	#package : 'BioPhylogenetics',
	#tag : 'Files'
}

{ #category : 'accessing' }
BioNewickFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: '	Newick'
]

{ #category : 'parsing' }
BioNewickFile >> readPhyloTree [
	"Parse the receiver's contents as a Newick string and answer a BioPhyloTree."

	^ BioPhyloTree readFromNewick: self contents
]

{ #category : 'parsing' }
BioNewickFile >> readPhyloTrees [
	"Answer an OrderedCollection of BioPhyloTree, one per top-level Newick statement in the file."

	^ (self contents splitOn: $;)
		  reject: #isEmpty
		  thenCollect: [ :each | BioPhyloTree readFromNewick: each ]
]

{ #category : 'writing' }
BioNewickFile >> writePhyloTree: aBioPhyloTree [
	"Write the Newick representation of aBioPhyloTree to the receiver's file."

	self contents: aBioPhyloTree newickString
]
