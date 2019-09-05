"
From the web page https://github.com/ExpressionAnalysis/ea-utils/blob/wiki/FastqMcf.md

fastq-mcf attempts to:

    Detect & remove sequencing adapters and primers
    Detect limited skewing at the ends of reads and clip
    Detect poor quality at the ends of reads and clip
    Detect Ns, and remove from ends
    Remove reads with CASAVA 'Y' flag (purity filtering)
    Discard sequences that are too short after all of the above
    Keep multiple mate-reads in sync while doing all of the above

"
Class {
	#name : #BioFASTQMcfWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioNGS-Trimming'
}

{ #category : #examples }
BioFASTQMcfWrapper class >> example01 [

	^ BioFASTQMcfWrapper new
		out: (self fastqcExamplesDir / 'cleanedR1.fq.gz') fullName;
		out: (self fastqcExamplesDir / 'cleanedR2.fq.gz') fullName;
		yourself
]

{ #category : #examples }
BioFASTQMcfWrapper class >> fastqcExamplesDir [
	" Answer a <FileDirectory> containing example files for FASTQC "

	^ self testFilesFullDirectoryName / 'fastqc'
]

{ #category : #properties }
BioFASTQMcfWrapper >> barReadPercentage: aFloat [
	" 'N' (Bad read) percentage causing cycle removal (20) "

	self propertyAt: 'x' ifAbsentPut: [ aFloat ]
]

{ #category : #options }
BioFASTQMcfWrapper >> debug [
	" Output lots of random debugging stuff "
	
	self addOption: 'd'
]

{ #category : #options }
BioFASTQMcfWrapper >> help [
	" Display help "
	
	self addOption: 'h'
]

{ #category : #options }
BioFASTQMcfWrapper >> illuminaPFDisableFilter [
	" Force disable/enable Illumina PF filtering (auto) "
	
	self addOption: 'u'
]

{ #category : #options }
BioFASTQMcfWrapper >> illuminaPFEnableFilter [
	" Force disable/enable Illumina PF filtering (auto) "
	
	self addOption: 'U'
]

{ #category : #properties }
BioFASTQMcfWrapper >> logScale: aFloat [
	" Log scale for adapter minimum-length-match (2.2) "

	self propertyAt: 'o' ifAbsentPut: [ aFloat ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> maximumAdapterDiff: aFloat [
	" Maximum adapter difference percentage (10) "

	self propertyAt: 'p' ifAbsentPut: [ aFloat ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> maximumRemainSeqLength: aNumber [
	" Maximum remaining sequence length (none) "

	self propertyAt: 'L' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> minimumClipLength: aNumber [
	" Minimum clip length, overrides scaled auto (1) "

	self propertyAt: 'm' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> minimumRemainSeqLength: aNumber [
	" Minimum remaining sequence length (19) "

	self propertyAt: 'l' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> out: fileName [  
	" Set the output file to fileName "

	self propertyAt: 'o' ifAbsentPut: [ fileName ]
]

{ #category : #options }
BioFASTQMcfWrapper >> preserveNs [
	" Dont remove Ns from the fronts/ends of reads "
	
	self addOption: 'R'
]

{ #category : #properties }
BioFASTQMcfWrapper >> qualityThreshold: aNumber [
	" quality threshold causing base removal (10) "

	self propertyAt: 'q' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> removeDupReads: aNumber [
	" Remove duplicate reads : Read_1 has an identical N bases (0) "

	self propertyAt: 'D' ifAbsentPut: [ aNumber ]
]

{ #category : #options }
BioFASTQMcfWrapper >> removeHomopolymerReads [
	" Remove >95% homopolymer reads (no) "
	
	self addOption: 'H'
]

{ #category : #options }
BioFASTQMcfWrapper >> saveDiscardedReads [
	" Save all discarded reads to '.skip' files "
	
	self addOption: 'S'
]

{ #category : #options }
BioFASTQMcfWrapper >> simulateClip [
	" Dont clip, just output what would be done "
	
	self addOption: 'n'
]

{ #category : #properties }
BioFASTQMcfWrapper >> skewPercentage: aFloat [
	" sKew percentage-less-than causing cycle removal (2) "

	self propertyAt: 'k' ifAbsentPut: [ aFloat ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> thresholdBeforeAdapterClipping: aFloat [
	" % occurance threshold before adapter clipping (0.25) "

	self propertyAt: 't' ifAbsentPut: [ aFloat ]
]

{ #category : #properties }
BioFASTQMcfWrapper >> windowSize: aNumber [
	" window-size for quality trimming (1) "

	self propertyAt: 'w' ifAbsentPut: [ aNumber ]
]

{ #category : #options }
BioFASTQMcfWrapper >> zero [
	" Set all default parameters to zero/do nothing "
	
	self addOption: '0'
]
