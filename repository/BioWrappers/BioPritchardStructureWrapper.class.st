"
Wrapper for the famous software Structure.

See class side for examples.

"
Class {
	#name : #BioPritchardStructureWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #accessing }
BioPritchardStructureWrapper class >> availablePlatforms [
	" Private - See superimplementor's comment "
	
	^ #('Unix' 'MacOS' 'Win32')
]

{ #category : #accessing }
BioPritchardStructureWrapper class >> description [

	^ 'The program structure is a free software package for using multi-locus genotype data to investigate population structure. Its uses include inferring the presence of distinct populations, assigning individuals to populations, studying hybrid zones, identifying migrants and admixed individuals, and estimating population allele frequencies in situations where many individuals are migrants or admixed. It can be applied to most of the commonly-used genetic markers, including SNPS, microsatellites, RFLPs and AFLPs.'
]

{ #category : #accessing }
BioPritchardStructureWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'Pritchard Structure'
]

{ #category : #accessing }
BioPritchardStructureWrapper class >> url [
	" See superimplementor's comment "

	^ 'http://pritchardlab.stanford.edu/structure.html'
]
