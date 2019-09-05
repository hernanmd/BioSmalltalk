"
Celera Genomics
6 December 2006 

"
Class {
	#name : #BioMMCelera,
	#superclass : #BioMMusculusGD,
	#category : 'BioNCBI-Genomes'
}

{ #category : #testing }
BioMMCelera class >> isAlternative [

	^ true
]

{ #category : #downloading }
BioMMCelera >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'mm_alt_Mm_Celera'.

]

{ #category : #accessing }
BioMMCelera >> latestVersionFound [
	" Private - See superimplementor's commemt "

	^ ''.
]
