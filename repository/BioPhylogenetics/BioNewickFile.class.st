Class {
	#name : #BioNewickFile,
	#superclass : #BioFile,
	#category : 'BioPhylogenetics-Files'
}

{ #category : #accessing }
BioNewickFile class >> possibleExtensions [
	" See superimplementor's comment"

	^ self fileFormatterClass fileExtensionsFor: '	Newick'
]
