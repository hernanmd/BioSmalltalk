"
Abstract class for downloading Bos Taurus chromosomes from NCBI

"
Class {
	#name : #BioBTauGD,
	#superclass : #BioNCBIChrGD,
	#category : #'BioNCBI-Genomes'
}

{ #category : #accessing }
BioBTauGD class >> maxChr [
	" Answer maximum number of chromosomes for the receiver "

	^ 29
]

{ #category : #accessing }
BioBTauGD >> organismName [
	" Private - See superimplementor's comment "

	^ 'Bos_taurus'
]
