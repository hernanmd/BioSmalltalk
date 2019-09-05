"
Genomic DNA sequence released by the Center for Bioinformatics and Computational Biology, University of Maryland on 01 December 2009 and used as the reference assembly. The NCBI reference sequence for the mitochondrion genome was also included in the reference assembly.

"
Class {
	#name : #BioBTauUMD,
	#superclass : #BioBTauGD,
	#category : 'BioNCBI-Genomes'
}

{ #category : #downloading }
BioBTauUMD >> defaultFileListPrefix [
	" Private - See superimplementor's comment "
	
	^ 'bt_ref_Bos_taurus_UMD_'.

]

{ #category : #accessing }
BioBTauUMD >> latestVersionFound [
	" Private - See superimplementor's commemt "

	^ '3.1.1'
]
