"
I am a wrapper for cutadapt, a tool for removing adapter sequences from high-throughput sequencing reads.

Cutadapt finds and removes adapter sequences, primers, poly-A tails, and other unwanted sequences from FASTQ/FASTA reads. It supports both single-end and paired-end data, quality trimming, and multiple filtering options.

Usage:
| wrapper |
wrapper := BioCutadaptWrapper new.
wrapper adapter3Prime: 'AGATCGGAAGAGC'.
wrapper input: 'reads.fastq'.
wrapper out: 'trimmed.fastq'.
wrapper minimumOverlapLength: 5.
wrapper execute.

Paired-end:
| wrapper |
wrapper := BioCutadaptWrapper new.
wrapper adapter3Prime: 'ADAPTER1'.
wrapper adapter3PrimeR2: 'ADAPTER2'.
wrapper out: 'trimmed_R1.fastq'.
wrapper pairedOutput: 'trimmed_R2.fastq'.
wrapper input: 'R1.fastq'.
wrapper execute.

Citation: Marcel Martin. Cutadapt removes adapter sequences from high-throughput sequencing reads. EMBnet.Journal, 17(1):10-12, 2011.
"
Class {
	#name : 'BioCutadaptWrapper',
	#superclass : 'BioWrapperObject',
	#category : 'BioNGS-Trimming',
	#package : 'BioNGS',
	#tag : 'Trimming'
}

{ #category : 'accessing' }
BioCutadaptWrapper class >> defaultProgramName [
	" Answer a <String> with the default program name "
	^ 'cutadapt'
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> action: aString [
	" Set what to do on match: trim, retain, mask, lowercase, crop, or none. Default: trim "

	^ self propertyAt: 'action' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapter3Prime: aSequenceString [
	" Set the 3' adapter sequence ligated to the 3' end (R1 for paired data). Appending $ anchors adapter as suffix. "

	^ self propertyAt: 'a' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapter3PrimeAnchored: aSequenceString [
	" Set the 3' adapter anchored as a suffix (appends $) "

	^ self propertyAt: 'a' ifAbsentPut: [ aSequenceString , '$' ]
]

{ #category : 'accessing-adapters-paired' }
BioCutadaptWrapper >> adapter3PrimeR2: aSequenceString [
	" Set the 3' adapter to be removed from R2 (second read in pair) "

	^ self propertyAt: 'A' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapter5Prime: aSequenceString [
	" Set the 5' adapter sequence ligated to the 5' end (R1 for paired data). Prepending ^ anchors adapter as prefix. "

	^ self propertyAt: 'g' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapter5PrimeAnchored: aSequenceString [
	" Set the 5' adapter anchored as a prefix (prepends ^) "

	^ self propertyAt: 'g' ifAbsentPut: [ '^' , aSequenceString ]
]

{ #category : 'accessing-adapters-paired' }
BioCutadaptWrapper >> adapter5PrimeR2: aSequenceString [
	" Set the 5' adapter to be removed from R2 (second read in pair) "

	^ self propertyAt: 'G' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapter: aSequenceString [
	" Set an adapter that may be ligated to the 5' or 3' end (both types of matches allowed). Use only if you do not know which end your adapter was ligated to. "

	^ self propertyAt: 'b' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapterLink: adapterSeq1 to: adapterSeq2 [
	" Set a linked adapter: first trim adapterSeq1 as 3' adapter, then trim adapterSeq2 as 5' adapter on the same read. "

	^ self
		  propertyAt: 'a'
		  ifAbsentPut: [ adapterSeq1 , '...' , adapterSeq2 ]
]

{ #category : 'accessing-adapters' }
BioCutadaptWrapper >> adapterLinkNoAnchoring: adapterSeq1 to: adapterSeq2 [
	" Set a linked adapter without anchoring: first trim adapterSeq1 as 5' adapter, then trim adapterSeq2 as 5' adapter on the same read. "

	^ self
		  propertyAt: 'g'
		  ifAbsentPut: [ adapterSeq1 , '...' , adapterSeq2 ]
]

{ #category : 'accessing-adapters-paired' }
BioCutadaptWrapper >> adapterR2: aSequenceString [
	" Set a 5'/3' adapter to be removed from R2 "

	^ self propertyAt: 'B' ifAbsentPut: [ aSequenceString ]
]

{ #category : 'private' }
BioCutadaptWrapper >> buildOptions: stream [
	" Private - Append receiver's options to stream "

	self options ifNil: [ ^ self ].
	self options do: [ :optString |
			stream space.
			optString size = 1
				ifTrue: [
						stream
							nextPut: $-;
							nextPutAll: optString ]
				ifFalse: [
						stream
							nextPutAll: '--';
							nextPutAll: optString ] ]
]

{ #category : 'private' }
BioCutadaptWrapper >> buildProperties: stream [
	" Private - Append receiver's properties to stream in cutadapt format.
	Short flags (1 char) use -X VALUE format.
	Long flags use --flag=VALUE format. "

	self properties ifNil: [ ^ self ].
	self properties associationsDo: [ :assoc |
			stream space.
			assoc key size = 1
				ifTrue: [
						stream
							nextPut: $-;
							nextPutAll: assoc key;
							space;
							nextPutAll: assoc value asString ]
				ifFalse: [
						stream
							nextPutAll: '--';
							nextPutAll: assoc key;
							nextPut: $=;
							nextPutAll: assoc value asString ] ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> compressionLevel: anInteger [
	" Set compression level for compressed output files. Default: 1 "

	^ self propertyAt: 'compression-level' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> cores: anInteger [
	" Set number of CPU cores. Use 0 to auto-detect. Default: 1 "

	^ self propertyAt: 'j' ifAbsentPut: [ anInteger ]
]

{ #category : 'programs' }
BioCutadaptWrapper >> cutadapt [
	" Answer a <String> with the receiver's executable name "
	
	^ 'cutadapt'
]

{ #category : 'programs' }
BioCutadaptWrapper >> defaultProgramName [ 
	" Private - See superimplementor's comment "

	^ self programNamed: self cutadapt
]

{ #category : 'accessing-filtering' }
BioCutadaptWrapper >> discardCasava [
	" Discard reads that did not pass CASAVA filtering "

	^ self addOption: 'discard-casava'
]

{ #category : 'options' }
BioCutadaptWrapper >> discardTrimmed [
	" Throw away reads in which an adapter was found. "

	 ^ self addOption: 'discard-trimmed'
]

{ #category : 'options' }
BioCutadaptWrapper >> discardUntrimmed [
	" Throw away reads in which no adapter was found "

	 ^ self addOption: 'discard-untrimmed'
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> errorRate: aNumber [
	" Set maximum allowed error rate (0 <= E < 1) or absolute number of errors (integer >= 1). Default: 0.1 "

	^ self propertyAt: 'e' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> infoFile: aFilename [
	" Write information about each read and adapter matches to aFilename "

	^ self propertyAt: 'info-file' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output-paired' }
BioCutadaptWrapper >> infoFilePaired: aFilename [
	" Write info about R2 to aFilename "

	^ self propertyAt: 'info-file-paired' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing' }
BioCutadaptWrapper >> input: aFilename [
	" Set the input FASTQ/FASTA file path (positional argument) "

	self addParameter: aFilename
]

{ #category : 'accessing-paired' }
BioCutadaptWrapper >> interleaved [
	" Read and/or write interleaved paired-end reads "

	^ self addOption: 'interleaved'
]

{ #category : 'private' }
BioCutadaptWrapper >> isDoubleDashProperties [
	" Answer <true> - long flag names use double dash "

	^ true
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> jsonReport: aFilename [
	" Dump report in JSON format to aFilename "

	^ self propertyAt: 'json' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> lengthTag: aString [
	" Replace decimal number after TAG in read description with correct trimmed length "

	^ self propertyAt: 'length-tag' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> matchReadWildcards [
	" Interpret IUPAC wildcards in reads "

	^ self addOption: 'match-read-wildcards'
]

{ #category : 'accessing-filtering' }
BioCutadaptWrapper >> maximumAverageErrorRate: aNumber [
	" Discard reads whose average error rate exceeds aNumber "

	^ self propertyAt: 'max-average-error-rate' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing-filtering' }
BioCutadaptWrapper >> maximumExpectedErrors: aNumber [
	" Discard reads whose expected number of errors exceeds aNumber "

	^ self propertyAt: 'max-expected-errors' ifAbsentPut: [ aNumber ]
]

{ #category : 'properties' }
BioCutadaptWrapper >> maximumLength: anInteger [
	" Throw away processed reads longer than anInteger bases "

	self propertyAt: 'M' ifAbsentPut: [ anInteger ]

]

{ #category : 'accessing-filtering' }
BioCutadaptWrapper >> maximumN: aNumber [
	" Discard reads with more than aNumber N bases. If 0-1, interpreted as fraction of read length "

	^ self propertyAt: 'max-n' ifAbsentPut: [ aNumber ]
]

{ #category : 'properties' }
BioCutadaptWrapper >> minimumLength: anInteger [
	" Throw away processed reads shorter than anInteger bases "

	self propertyAt: 'm' ifAbsentPut: [ anInteger ]

]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> minimumOverlapLength: anInteger [
	" Require at least anInteger overlap between read and adapter. Default: 3 "

	^ self propertyAt: 'O' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> nextseqTrim: anInteger [
	" NextSeq-specific quality trimming: trim bases with quality < anInteger from 3' end "

	^ self propertyAt: 'nextseq-trim' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> noIndels [
	" Allow only mismatches in alignments (no indels). Default: allow both "

	^ self addOption: 'no-indels'
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> noMatchAdapterWildcards [
	" Do not interpret IUPAC wildcards in adapters "

	^ self addOption: 'no-match-adapter-wildcards'
]

{ #category : 'accessing' }
BioCutadaptWrapper >> out: aFilename [
	" Set the output file path "

	^ self propertyAt: 'o' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> outputFasta [
	" Output FASTA even on FASTQ input "

	^ self addOption: 'fasta'
]

{ #category : 'accessing-paired' }
BioCutadaptWrapper >> pairAdapters [
	" Treat adapters given with -a/-A etc. as pairs "

	^ self addOption: 'pair-adapters'
]

{ #category : 'accessing-paired' }
BioCutadaptWrapper >> pairFilter: aString [
	" Set which reads must match filter: any, both, or first. Default: any "

	^ self propertyAt: 'pair-filter' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-output-paired' }
BioCutadaptWrapper >> pairedOutput: aFilename [
	" Set the output file for R2 in paired-end mode "

	^ self propertyAt: 'p' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> polyA [
	" Trim poly-A tails "

	^ self addOption: 'poly-a'
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> prefix: aString [
	" Add this prefix to read names. Use {name} for adapter name. "

	^ self propertyAt: 'x' ifAbsentPut: [ aString ]
]

{ #category : 'private' }
BioCutadaptWrapper >> propertyAt: keyName ifAbsentPut: aBlock [
	" Store property. Single-char keys use space separator, multi-char keys use = separator "

	keyName size = 1 ifTrue: [ self propertySeparator: Character space ].
	^ super propertyAt: keyName ifAbsentPut: aBlock
]

{ #category : 'properties' }
BioCutadaptWrapper >> qualityBase64 [
	"  "

	self propertySeparator: $=.
	self propertyAt: 'quality-base' ifAbsentPut: [ 64 ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> qualityBase: anInteger [
	" Set quality encoding base (33 for Sanger/Illumina 1.8+, 64 for old Illumina). Default: 33 "

	^ self propertyAt: 'quality-base' ifAbsentPut: [ anInteger ]
]

{ #category : 'properties' }
BioCutadaptWrapper >> qualityCutOff: aNumberOrAssociation [
	" Trim low-quality ends from reads BEFORE adapter removal. By default only the 3' end of each read is trimmed, use an <Association> as paramter to trim the 5' end as well "

	self propertyAt: 'q' ifAbsentPut: [ aNumberOrAssociation asBioCutadaptParameter ]

]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> qualityCutoff: aNumberOrAssociation [
	" Trim low-quality bases from 5' and/or 3' ends before adapter removal. Single number: 3' end only. Association: 5'->3' "

	^ self propertyAt: 'q' ifAbsentPut: [ aNumberOrAssociation ]
]

{ #category : 'accessing-parameters-paired' }
BioCutadaptWrapper >> qualityCutoffR2: aNumberOrAssociation [
	" Set quality trimming cutoff for R2. Default: same as R1 "

	^ self propertyAt: 'Q' ifAbsentPut: [ aNumberOrAssociation ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> quiet [
	" Print only error messages "

	^ self addOption: 'quiet'
]

{ #category : 'properties' }
BioCutadaptWrapper >> removeBases: aNumber [
	" Remove aNumber of bases from the beginning or end of each read. Applied before any adapter trimming "

	self propertyAt: 'u' ifAbsentPut: [ aNumber ]
]

{ #category : 'accessing-parameters-paired' }
BioCutadaptWrapper >> removeBasesR2: anInteger [
	" Remove anInteger bases from R2. Positive: beginning. Negative: end. "

	^ self propertyAt: 'U' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> rename: aString [
	" Rename reads using template with variables {id}, {adapter_name}, etc. "

	^ self propertyAt: 'rename' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> reportFull [
	" Print full report (default) "

	^ self propertyAt: 'report' ifAbsentPut: [ 'full' ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> reportMinimal [
	" Print minimal report "

	^ self propertyAt: 'report' ifAbsentPut: [ 'minimal' ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> restFile: aFilename [
	" Write remainder of reads (after adapter in middle) to aFilename "

	^ self propertyAt: 'r' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> revcomp [
	" Check both the read and its reverse complement for adapter matches "

	^ self addOption: 'rc'
]

{ #category : 'accessing-parameters-paired' }
BioCutadaptWrapper >> shortenR2: anInteger [
	" Shorten R2 to anInteger. Default: same as R1 "

	^ self propertyAt: 'L' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> shortenReads: anInteger [
	" Shorten reads to anInteger bases. Positive: remove from end. Negative: remove from beginning. Applied after adapter trimming. "

	^ self propertyAt: 'l' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> stripSuffix: aString [
	" Remove this suffix from read names if present "

	^ self propertyAt: 'strip-suffix' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> suffix: aString [
	" Add this suffix to read names. Use {name} for adapter name. "

	^ self propertyAt: 'y' ifAbsentPut: [ aString ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> times: anInteger [
	" Remove up to anInteger adapters from each read. Default: 1 "

	^ self propertyAt: 'n' ifAbsentPut: [ anInteger ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> tooLongOutput: aFilename [
	" Write reads that are too long (per -M) to aFilename instead of discarding "

	^ self propertyAt: 'too-long-output' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output-paired' }
BioCutadaptWrapper >> tooLongPairedOutput: aFilename [
	" Write R2 when pair is too long to aFilename "

	^ self
		  propertyAt: 'too-long-paired-output'
		  ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> tooShortOutput: aFilename [
	" Write reads that are too short (per -m) to aFilename instead of discarding "

	^ self propertyAt: 'too-short-output' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output-paired' }
BioCutadaptWrapper >> tooShortPairedOutput: aFilename [
	" Write R2 when pair is too short to aFilename "

	^ self
		  propertyAt: 'too-short-paired-output'
		  ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> trimN [
	" Trim N's on ends of reads "

	^ self addOption: 'trim-n'
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> untrimmedOutput: aFilename [
	" Write reads without adapters to aFilename instead of regular output "

	^ self propertyAt: 'untrimmed-output' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output-paired' }
BioCutadaptWrapper >> untrimmedPairedOutput: aFilename [
	" Write R2 without adapters to aFilename (use with untrimmedOutput:) "

	^ self
		  propertyAt: 'untrimmed-paired-output'
		  ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-output' }
BioCutadaptWrapper >> wildcardFile: aFilename [
	" Write adapter bases matching wildcard positions to aFilename "

	^ self propertyAt: 'wildcard-file' ifAbsentPut: [ aFilename ]
]

{ #category : 'accessing-parameters' }
BioCutadaptWrapper >> zeroCap [
	" Change negative quality values to zero "

	^ self addOption: 'zero-cap'
]
