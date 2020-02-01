"
See https://mafft.cbrc.jp/alignment/software/manual/manual.html for details

"
Class {
	#name : #BioMAFFTWrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Programs'
}

{ #category : #accessing }
BioMAFFTWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'Mafft'
]

{ #category : #accessing }
BioMAFFTWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:12 pm"

	^ 'http://mafft.cbrc.jp/alignment/software/'
]

{ #category : #accessing }
BioMAFFTWrapper >> auto [
	" Automatically selects an appropriate strategy from L-INS-i, FFT-NS-i and FFT-NS-2, according to data size. Default: off (always FFT-NS-2) "

	^ self addOption: 'auto'

]

{ #category : #accessing }
BioMAFFTWrapper >> clustalout [
	" Output format: clustal format. Default: off (fasta format)  "

	^ self addOption: 'clustalout'

]

{ #category : #accessing }
BioMAFFTWrapper >> fastapair [
	"  All pairwise alignments are computed with FASTA (Pearson and Lipman 1988). FASTA is required. Default: off (6mer distance is used) "

	^ self addOption: 'fastapair'

]

{ #category : #accessing }
BioMAFFTWrapper >> genafpair [
	"  All pairwise alignments are computed with a local algorithm with the generalized affine gap cost (Altschul 1998). More accurate but slower than --6merpair. Suitable when large internal gaps are expected. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (E-INS-i). Default: off (6mer distance is used).
	
	E-INS-i (suitable for sequences containing large unalignable regions; recommended for <200 sequences) "

	^ self addOption: 'genafpair'

]

{ #category : #accessing }
BioMAFFTWrapper >> globalpair [
	" All pairwise alignments are computed with the Needleman-Wunsch algorithm. More accurate but slower than --6merpair. Suitable for a set of globally alignable sequences. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (G-INS-i). Default: off (6mer distance is used).	
	G-INS-i (suitable for sequences of similar lengths; recommended for <200 sequences; iterative refinement method incorporating global pairwise alignment information) "

	^ self addOption: 'globalpair'

]

{ #category : #accessing }
BioMAFFTWrapper >> inputorder [
	" Output order: same as input. Default: on "

	^ self addOption: 'inputorder'

]

{ #category : #accessing }
BioMAFFTWrapper >> localpair [
	" All pairwise alignments are computed with the Smith-Waterman algorithm. More accurate but slower than --6merpair. Suitable for a set of locally alignable sequences. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (L-INS-i). Default: off (6mer distance is used).
	L-INS-i (probably most accurate; recommended for <200 sequences; iterative refinement method incorporating local pairwise alignment information) "

	^ self addOption: 'localpair'

]

{ #category : #programs }
BioMAFFTWrapper >> mafft [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:12 pm"

	^ 'mafft'
]

{ #category : #accessing }
BioMAFFTWrapper >> maxiterate: aNumber [
	" Number cycles of iterative refinement are performed. Default: 0  "

	^ self propertyAt: 'maxiterate' ifAbsentPut: [ aNumber ]

]

{ #category : #accessing }
BioMAFFTWrapper >> reorder [
	" Output order: aligned. Default: off (inputorder) "

	^ self addOption: 'reorder'

]

{ #category : #accessing }
BioMAFFTWrapper >> retree: aNumber [
	" By the --retree 1 option, the speed is increased (about two times) and the accuracy is reduced:   "

	^ self propertyAt: 'retree' ifAbsentPut: [ aNumber ]

]

{ #category : #accessing }
BioMAFFTWrapper >> treeout [
	" Guide tree is output to the input.tree file. Default: off "

	^ self addOption: 'treeout'

]
