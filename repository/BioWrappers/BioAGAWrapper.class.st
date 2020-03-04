"
AGA, an Annotated Genome Aligner.

As input, AGA requires a reference genome and a query sequence.

The reference genome is provided as a GENBANK flatfile record. For example, go to https://www.ncbi.nlm.nih.gov/nuccore/NC_001802.1, choose Send to:, File, Format Genbank.



"
Class {
	#name : #BioAGAWrapper,
	#superclass : #BioWrapperObject,
	#category : #'BioWrappers-Aligners'
}

{ #category : #accessing }
BioAGAWrapper class >> aga [

	^ 'aga'
]

{ #category : #accessing }
BioAGAWrapper class >> defaultProgramName [
	" Private - See superimplementor's comment "

	^ self aga
]

{ #category : #accessing }
BioAGAWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'aga'
]

{ #category : #overrides }
BioAGAWrapper class >> url [

	^ 'https://github.com/emweb/aga'
]

{ #category : #properties }
BioAGAWrapper >> aaFrameshift: aNumber [ 
	" Frameshift penalty (default=-100) "

	self propertyAt: 'aa-frameshift' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> aaGapExtend: aNumber [ 
	" Amino Acid Gap Extension penalty (default=-2) "

	self propertyAt: 'aa-gap-extend' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> aaGapOpen: aNumber [ 
	" Amino Acid Gap Open penalty (default=-6) "

	self propertyAt: 'aa-gap-open' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> aaMatrix: aNumber [ 
	" Substitution matrix for amino acid matches: BLOSUM62 or BLOSUM30 (default=BLOSUM30) "

	self propertyAt: 'aa-matrix' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> aaMisalign: aNumber [ 
	" Codon misalignment penalty (default=-20) "

	self propertyAt: 'aa-misalign' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> aaWeight: aNumber [ 
	" Total weight for AA score fraction (default=1) "

	self propertyAt: 'aa-weight' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> cdsAaAlignments: fastaFile [ 
	" Amino acid alignments output file of CDS (FASTA) "

	self propertyAt: 'cds-aa-alignments' ifAbsentPut: [ fastaFile ]
]

{ #category : #properties }
BioAGAWrapper >> cdsNtAlignments: fastaFile [ 
	" Nucleic acid alignments output file of CDS (FASTA) "

	self propertyAt: 'cds-nt-alignments' ifAbsentPut: [ fastaFile ]
]

{ #category : #accessing }
BioAGAWrapper >> global [
	" Set Global alignment "

	 ^ self addOption: 'global'
]

{ #category : #accessing }
BioAGAWrapper >> help [
	" Display help information and exit "

	 ^ self addOption: 'help'
]

{ #category : #accessing }
BioAGAWrapper >> inFastaQuery: inputFilename [
	" FASTA file with nucleic acid query sequence "

	self addParameter: inputFilename
	
]

{ #category : #accessing }
BioAGAWrapper >> inGenBankRef: inputFilename [
	"  Annotated reference (Genbank Record format: .gb file) "

	self addParameter: inputFilename
	
]

{ #category : #accessing }
BioAGAWrapper >> local [
	" Set Local alignment "

	 ^ self addOption: 'local'
]

{ #category : #properties }
BioAGAWrapper >> ntGapExtend: aNumber [ 
	" Nucleotide Gap Extension penalty (default=-1) "

	self propertyAt: 'nt-gap-extend' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> ntGapOpen: aNumber [ 
	" Nucleotide Gap Open penalty (default=-10) "

	self propertyAt: 'nt-gap-open' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> ntMatch: aNumber [ 
	" Score for a nucleotide match (default=2) "

	self propertyAt: 'nt-match' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> ntMismatch: aNumber [ 
	" Penalty for a nucleotide mismatch (default=-2) "

	self propertyAt: 'nt-mismatch' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioAGAWrapper >> ntWeight: aNumber [ 
	" Weight for NT score fraction (default=1) "

	self propertyAt: 'nt-weight' ifAbsentPut: [ aNumber ]
]

{ #category : #accessing }
BioAGAWrapper >> outFastaAlign: outputFilename [
	" Set outputFilename as the FASTA alignment output file "

	self addParameter: outputFilename
	
]

{ #category : #properties }
BioAGAWrapper >> proteinAaAlignments: fastaFile [ 
	" Amino acid alignments output file of Protein Products (FASTA) "

	self propertyAt: 'protein-aa-alignments' ifAbsentPut: [ fastaFile ]
]

{ #category : #properties }
BioAGAWrapper >> proteinNtAlignments: fastaFile [ 
	" Nucleic acid alignments output file of Protein Products (FASTA) "

	self propertyAt: 'protein-nt-alignments' ifAbsentPut: [ fastaFile ]
]

{ #category : #accessing }
BioAGAWrapper >> strictCodonBoundaries [
	" Do not optimize at codon boundaries "

	 ^ self addOption: 'strict-codon-boundaries'
]

{ #category : #accessing }
BioAGAWrapper >> version [
	" Display version information and exit "

	 ^ self addOption: 'version'
]
