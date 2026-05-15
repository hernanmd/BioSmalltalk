"
Represents the nucleotide collection database in the NCBI system.
"
Class {
	#name : 'BioNCBINucleotideCollection',
	#superclass : 'BioNCBIDatabase',
	#category : 'BioNCBI-Databases',
	#package : 'BioNCBI',
	#tag : 'Databases'
}

{ #category : 'accessing' }
BioNCBINucleotideCollection class >> dbName [

	^ 'nr'
]

{ #category : 'accessing' }
BioNCBINucleotideCollection class >> description [

	^ 'Nucleotide collection (nr/nt)'
]
