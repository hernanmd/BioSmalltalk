"
Genome Reference Consortium 
"
Class {
	#name : #BioMMusculusGRCm,
	#superclass : #BioMMusculusGD,
	#category : 'BioNCBI-Genomes'
}

{ #category : #downloading }
BioMMusculusGRCm >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'mm_ref_GRCm'
]

{ #category : #accessing }
BioMMusculusGRCm >> latestVersionFound [
	" Private - See superimplementor's commemt "

	^ '38.p4'
]
