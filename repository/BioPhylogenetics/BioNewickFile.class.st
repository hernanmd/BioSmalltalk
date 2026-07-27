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
