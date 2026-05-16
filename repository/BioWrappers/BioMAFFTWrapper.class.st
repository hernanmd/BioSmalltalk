"
I am a wrapper for MAFFT (Multiple Alignment using Fast Fourier Transform), a multiple sequence alignment program.

MAFFT offers various alignment strategies ranging from fast progressive methods (FFT-NS-2) to accurate iterative methods (L-INS-i, E-INS-i, G-INS-i). It supports protein and nucleotide alignments with configurable scoring matrices and gap penalties.

Usage:
| wrapper |
wrapper := BioMAFFTWrapper new.
wrapper auto.
wrapper input: 'sequences.fasta'.
wrapper out: 'aligned.fasta'.
wrapper execute.

Strategies:
wrapper linsi.      ""L-INS-i (local, iterative)""
wrapper einsi.      ""E-INS-i (generalized affine, iterative)""
wrapper ginsi.      ""G-INS-i (global, iterative)""
wrapper fftns2.     ""FFT-NS-2 (fast progressive)""
wrapper fftns1.     ""FFT-NS-1 (faster, less accurate)""

citation: Katoh and Standley, MAFFT multiple sequence alignment software version 7, Mol Biol Evol 30:772-780 (2013)
"
Class {
	#name : 'BioMAFFTWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioWrappers-Aligners',
	#package : 'BioWrappers',
	#tag : 'Aligners'
}

{ #category : 'accessing' }
BioMAFFTWrapper class >> defaultProgramName [
	" Private - See superimplementor's comment "

	^ self mafft
]

{ #category : 'accessing' }
BioMAFFTWrapper class >> mafft [
	" See superimplementor's comment "

	^ 'mafft'
]

{ #category : 'accessing' }
BioMAFFTWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'Mafft'
]

{ #category : 'accessing' }
BioMAFFTWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:12 pm"

	^ 'http://mafft.cbrc.jp/alignment/software/'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> addgappyregion [
	" Add gappy regions to the alignment (--addgappyregion) "

	^ self addOption: 'addgappyregion'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> adjustDirection [
	"Adjust direction of sequences according to the first sequence (--adjustdirection) "

	^ self addOption: 'adjustdirection'
]

{ #category : 'accessing' }
BioMAFFTWrapper >> auto [
	" Automatically selects an appropriate strategy from L-INS-i, FFT-NS-i and FFT-NS-2, according to data size. Default: off (always FFT-NS-2) "

	^ self addOption: 'auto'

]

{ #category : 'private' }
BioMAFFTWrapper >> buildProperties: stream [
	" Private - Append receiver's properties to stream, excluding 'out' which is handled by stdout redirection "

	self properties ifNil: [ ^ self ].
	self properties associationsDo: [ :assoc |
			assoc key = 'out' ifFalse: [
					stream space.
					self buildPropertySeparator: assoc into: stream.
					self buildPropertyValue: assoc into: stream ] ]
]

{ #category : 'accessing' }
BioMAFFTWrapper >> clustalout [
	" Output format: clustal format. Default: off (fasta format)  "

	^ self addOption: 'clustalout'

]

{ #category : 'private' }
BioMAFFTWrapper >> cmdLine [
	" Answer a <String> with the full command line for MAFFT.
	MAFFT writes to stdout, so output redirection via > is used when out: is set. "

	| baseCmd outputCmd |
	baseCmd := String streamContents: [ :stream |
			           stream
				           nextPutAll: self programName;
				           nextPutAll: self buildCmdLine ].
	outputCmd := (self propertyAt: 'out' ifAbsent: [ nil ])
		             ifNil: [ baseCmd ]
		             ifNotNil: [ :outFile | baseCmd , ' > ' , outFile ].
	^ outputCmd
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> dash [
	" Add structural information using dash (--dash) "

	^ self addOption: 'dash'
]

{ #category : 'defaults' }
BioMAFFTWrapper >> defaultPropertySeparator [
	" Private - See superimplementor's comment "
	
	^ Character space
]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> einsi [
	" E-INS-i: Generalized affine gap cost with iterative refinement. Accurate for sequences with large internal gaps. "

	^ self
		  genafpair;
		  maxiterate: 1000
]

{ #category : 'accessing' }
BioMAFFTWrapper >> fastapair [
	"  All pairwise alignments are computed with FASTA (Pearson and Lipman 1988). FASTA is required. Default: off (6mer distance is used) "

	^ self addOption: 'fastapair'

]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> fftns1 [
	" FFT-NS-1 strategy: iterative refinement with retree 1. Faster but less accurate. "

	^ self
		  addOption: 'retree';
		  addParameter: '1'
]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> fftns2 [
	" FFT-NS-2 strategy: fast, progressive method. "

	^ self
		  addOption: 'retree';
		  addParameter: '2'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> gapOpeningPenalty: aNumber [
	" Set gap opening penalty. Default: 1.53 (--op) "

	^ self propertyAt: 'op' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing' }
BioMAFFTWrapper >> genafpair [
	"  All pairwise alignments are computed with a local algorithm with the generalized affine gap cost (Altschul 1998). More accurate but slower than --6merpair. Suitable when large internal gaps are expected. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (E-INS-i). Default: off (6mer distance is used).
	
	E-INS-i (suitable for sequences containing large unalignable regions; recommended for <200 sequences) "

	^ self addOption: 'genafpair'

]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> ginsi [
	" G-INS-i: Global pairwise alignment with iterative refinement. Accurate for globally alignable sequences. "

	^ self
		  globalpair;
		  maxiterate: 1000
]

{ #category : 'accessing' }
BioMAFFTWrapper >> globalpair [
	" All pairwise alignments are computed with the Needleman-Wunsch algorithm. More accurate but slower than --6merpair. Suitable for a set of globally alignable sequences. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (G-INS-i). Default: off (6mer distance is used).	
	G-INS-i (suitable for sequences of similar lengths; recommended for <200 sequences; iterative refinement method incorporating global pairwise alignment information) "

	^ self addOption: 'globalpair'

]

{ #category : 'accessing' }
BioMAFFTWrapper >> input: aFilename [
	" Set the input FASTA file path (positional argument) "

	^ self addParameter: aFilename
]

{ #category : 'accessing' }
BioMAFFTWrapper >> inputorder [
	" Output order: same as input. Default: on "

	^ self addOption: 'inputorder'

]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> leavegappyregion [
	" Leave gappy regions as gaps (--leavegappyregion) "

	^ self addOption: 'leavegappyregion'
]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> linsi [
	" L-INS-i: Local pairwise alignment with iterative refinement. Accurate for locally alignable sequences. "

	^ self
		  localpair;
		  maxiterate: 1000
]

{ #category : 'accessing' }
BioMAFFTWrapper >> localpair [
	" All pairwise alignments are computed with the Smith-Waterman algorithm. More accurate but slower than --6merpair. Suitable for a set of locally alignable sequences. Applicable to up to ~200 sequences. A combination with --maxiterate 1000 is recommended (L-INS-i). Default: off (6mer distance is used).
	L-INS-i (probably most accurate; recommended for <200 sequences; iterative refinement method incorporating local pairwise alignment information) "

	^ self addOption: 'localpair'

]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixBLOSUM30 [
	" Use BLOSUM30 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'BL30' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixBLOSUM45 [
	" Use BLOSUM45 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'BL45' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixBLOSUM62 [
	" Use BLOSUM62 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'BL62' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixBLOSUM80 [
	" Use BLOSUM80 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'BL80' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixJTT100 [
	" Use JTT100 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'JTT100' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixJTT200 [
	" Use JTT200 scoring matrix for protein alignments "

	^ self propertyAt: 'scorematrix' ifAbsentPut: [ 'JTT200' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixKimura1 [
	" Use Kimura 1-parameter scoring matrix for nucleotide alignments "

	^ self propertyAt: 'scorematrixnuc' ifAbsentPut: [ '1' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixKimura20 [
	" Use Kimura 20-parameter scoring matrix for nucleotide alignments "

	^ self propertyAt: 'scorematrixnuc' ifAbsentPut: [ '20' ]
]

{ #category : 'accessing-matrices' }
BioMAFFTWrapper >> matrixKimura200 [
	" Use Kimura 200-parameter scoring matrix for nucleotide alignments "

	^ self propertyAt: 'scorematrixnuc' ifAbsentPut: [ '200' ]
]

{ #category : 'accessing' }
BioMAFFTWrapper >> maxiterate: aNumber [
	" Number cycles of iterative refinement are performed. Default: 0  "

	^ self propertyAt: 'maxiterate' ifAbsentPut: [ aNumber ]

]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> nwns [
	" NW-NS strategy: uses Needleman-Wunsch for progressive alignment. "

	^ self addOption: 'nwns'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> offsetValue: aNumber [
	" Set offset value (works like gap extension penalty). Default: 0.0 (--ep) "

	^ self propertyAt: 'ep' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing' }
BioMAFFTWrapper >> out: aFilename [
	" Set the output file path. MAFFT writes to stdout; the wrapper redirects output to this file. "

	^ self propertyAt: 'out' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output' }
BioMAFFTWrapper >> outputFormatClustal [
	" Output in Clustal format (--clustalout) "

	^ self clustalout
]

{ #category : 'accessing-output' }
BioMAFFTWrapper >> outputFormatFasta [
	" Output in FASTA format (default). Explicitly re-enables FASTA output if clustalout was set. "

	self removeOption: 'clustalout'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> quiet [
	" Do not report progress (--quiet) "

	^ self addOption: 'quiet'
]

{ #category : 'accessing' }
BioMAFFTWrapper >> reorder [
	" Output order: aligned. Default: off (inputorder) "

	^ self addOption: 'reorder'

]

{ #category : 'accessing' }
BioMAFFTWrapper >> retree: aNumber [
	" By the --retree 1 option, the speed is increased (about two times) and the accuracy is reduced:   "

	^ self propertyAt: 'retree' ifAbsentPut: [ aNumber ]

]

{ #category : 'accessing-strategy' }
BioMAFFTWrapper >> sixmerpair [
	" Use 6mer distance for pairwise alignments. Default method. "

	^ self addOption: '6merpair'
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> thread: anInteger [
	" Set number of threads. Use -1 for auto-detection. (--thread) "

	^ self propertyAt: 'thread' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> treeIn: aFilename [
	" Read guide tree from file (--treein) "

	^ self propertyAt: 'treein' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> treeOut [
	" Output guide tree to file (--treeout) "

	^ self addOption: 'treeout'
]

{ #category : 'accessing' }
BioMAFFTWrapper >> treeout [
	" Guide tree is output to the input.tree file. Default: off "

	^ self addOption: 'treeout'

]

{ #category : 'accessing-parameters' }
BioMAFFTWrapper >> unalignLevel: aNumber [
	" Set the unalign level. 0: always aligned, 1: always unaligned. Between: partially unaligned (--unalignlevel) "

	^ self propertyAt: 'unalignlevel' ifAbsentPut: [ aNumber ]
]
