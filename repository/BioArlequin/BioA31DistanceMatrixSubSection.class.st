"
Represents a distance matrix subsection within an Arlequin 3.1 input file. Used to specify pairwise genetic distance data between samples.
"
Class {
	#name : 'BioA31DistanceMatrixSubSection',
	#superclass : 'BioA31INISection',
	#category : 'BioArlequin-Sections',
	#package : 'BioArlequin',
	#tag : 'Sections'
}

{ #category : 'accessing' }
BioA31DistanceMatrixSubSection class >> notation [
	" Answer a String describing the receiver's section identifier "
	
	^ '[DistanceMatrix]'
]
