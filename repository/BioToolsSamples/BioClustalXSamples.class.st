"
Sample scripts for using Clustal
"
Class {
	#name : #BioClustalXSamples,
	#superclass : #BioSamples,
	#category : 'BioToolsSamples-Core'
}

{ #category : #'samples-data' }
BioClustalXSamples >> clustalSample01 [
	" CLUSTAL X (1.8) multiple sequence alignment.
	From http://www.molbiol-tools.ca/Jie_Zheng/example.aln "

	^ 'aer      TAAAGATAACCGCAGCGGGGCCGACATAA
flgM     TAAAGATTACCCGTCCCTTGCCGATAAAT
fliC     TAAAGGTTGTTTTACGACAGACGATAACA
fliD     TAAACTTTGCGCAATTCAGACCGATAACC
flxA     TAAAGATTTTTTTGTGCATGCCGATAGTG
tar      TAAAGTTTCCCCCCTCCTTGCCGATAACG
ycgR     TTAAGTTTTGTTAACTGTGACCGATAAAC
flgK     TCAAGTCCGGCGGGTCGCTGCCGATAATA
trg      TAAGTAATTACCGTCAAGTGCCGATGACT
motA     TAAACTTTCCCAGAATCCTGCCGATATTA
yhjH     TAAAGTTCTGCCCTTACGCGCCGATAATC
tsr      TAAAGTTTTTCCTTTCCAGGCCGAAAATC'
]
