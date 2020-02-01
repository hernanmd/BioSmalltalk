"
A BioHCDownloader is a class for downloading human chromosome from NCBI

Usage Example:

BioHSapiensGD new downloadChromosome: 22.

"
Class {
	#name : #BioHSapiensGD,
	#superclass : #BioNCBIChrGD,
	#category : #'BioNCBI-Genomes'
}

{ #category : #accessing }
BioHSapiensGD class >> maxChr [
	" Answer maximum number of chromosomes for the receiver "
	
	^ 22
]

{ #category : #downloading }
BioHSapiensGD >> defaultFileListPrefix [
	" Private - See superimplementor's comment "

	^ 'hs_alt_HuRef'
]

{ #category : #accessing }
BioHSapiensGD >> organismName [

	^ 'H_sapiens'
]
