"
Genome downloader for Mus musculus (mouse) chromosomes from NCBI. Extends BioNCBIChrGD with mouse-specific chromosome configuration.
"
Class {
	#name : 'BioMMusculusGD',
	#superclass : 'BioNCBIChrGD',
	#category : 'BioNCBI-Genomes',
	#package : 'BioNCBI',
	#tag : 'Genomes'
}

{ #category : 'accessing' }
BioMMusculusGD class >> maxChr [
	" Answer maximum number of chromosomes for the receiver "

	^ 19
]

{ #category : 'accessing' }
BioMMusculusGD >> organismName [

	^ 'M_musculus'
]
