Class {
	#name : #BioMMusculusGD,
	#superclass : #BioNCBIChrGD,
	#category : #'BioNCBI-Genomes'
}

{ #category : #accessing }
BioMMusculusGD class >> maxChr [
	" Answer maximum number of chromosomes for the receiver "

	^ 19
]

{ #category : #accessing }
BioMMusculusGD >> organismName [

	^ 'M_musculus'
]
