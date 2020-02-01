"
Genomic DNA sequence released by the International Chicken Genome Sequencing Consortium on Nov-22-2011 and used as the reference assembly. 

The NCBI reference sequence for the mitochondrial genome was also included in the reference assembly.
"
Class {
	#name : #BioGallusGallusGD,
	#superclass : #BioNCBIChrGD,
	#category : #'BioNCBI-Genomes'
}

{ #category : #accessing }
BioGallusGallusGD class >> maxChr [
	" Answer maximum number of chromosomes for the receiver "
	
	^ 32
]

{ #category : #downloading }
BioGallusGallusGD >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'gga_ref_Gallus_gallus-'.

]

{ #category : #accessing }
BioGallusGallusGD >> latestVersionFound [
	" Private - See superimplementor's commemt "

	^ '4.0'.
]
