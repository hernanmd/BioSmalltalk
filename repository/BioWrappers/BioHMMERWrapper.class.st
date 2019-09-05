"
Wrapper for HMMER programs (see programs category).

To run the examples HMMER must be installed in the host system. See class side for examples.


"
Class {
	#name : #BioHMMERWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #accessing }
BioHMMERWrapper class >> availablePlatforms [
	" Private - See superimplementor's comment "
	
	^ #('Unix' 'MacOS' 'Win32')
]

{ #category : #defaults }
BioHMMERWrapper class >> defaultProgramName [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ self phmmer
]

{ #category : #examples }
BioHMMERWrapper class >> example1 [
	" Answer a <String> with the receiver's help text "
	
	^ BioHMMERWrapper new
			help;
			execute.

]

{ #category : #examples }
BioHMMERWrapper class >> example2 [
	" hmmbuild globins4.hmm tutorial/globins4.sto "
	" hmmsearch globins4.hmm uniprot sprot.fasta > globins4.out "
	
	| samplesDir hmmFile stoFile fastaFile outputFile |

	samplesDir := BioObject testFilesFullDirectoryName.
	hmmFile := (samplesDir / 'globins4.hmm') fullName.
	stoFile :=  (samplesDir / 'globins4.sto') fullName.
	BioHMMERWrapper new
			addParameter: hmmFile;
			addParameter: stoFile;
			runHmmBuild;
			execute.

	fastaFile := (samplesDir / 'globins45.fa') fullName.
	outputFile :=  (samplesDir / 'globins4.out') fullName.
	^ BioHMMERWrapper new
			runHmmSearch;
			addParameter: hmmFile;
			addParameter: fastaFile;
			addOption: 'o' value: outputFile;
			execute.
]

{ #category : #programs }
BioHMMERWrapper class >> phmmer [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'phmmer'
]

{ #category : #examples }
BioHMMERWrapper class >> programLocation [
	" Answer a FileReference with the receiver's location in the system "
	
	^ BioExecutionEngine locateProgram: 'phmmer'

]

{ #category : #accessing }
BioHMMERWrapper class >> softwareName [
	" See superimplementor's comment "

	^ 'HMMER'
]

{ #category : #accessing }
BioHMMERWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:04 pm"

	^ 'http://hmmer.janelia.org/'
]

{ #category : #properties }
BioHMMERWrapper >> A: f [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"save multiple alignment of hits to file <s>"

	 ^ self propertyAt: 'A' ifAbsentPut: [ f ]
]

{ #category : #properties }
BioHMMERWrapper >> E: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"report sequences <= this E-value threshold in output  [10.0]  (x>0)"

	 ^ self propertyAt: 'E' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> EfL: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"length of sequences for Forward exp tail tau fit  [100]  (n>0)"

	 ^ self propertyAt: 'EfL' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> EfN: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"number of sequences for Forward exp tail tau fit  [200]  (n>0)"

	 ^ self propertyAt: 'EfN' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> Eft: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"tail mass for Forward exponential tail tau fit  [0.04]  (0<x<1)"

	 ^ self propertyAt: 'Eft' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> EmL: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"length of sequences for MSV Gumbel mu fit  [200]  (n>0)"

	 ^ self propertyAt: 'EmL' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> EmN: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"number of sequences for MSV Gumbel mu fit  [200]  (n>0)"

	 ^ self propertyAt: 'EmN' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> EvL: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"length of sequences for Viterbi Gumbel mu fit  [200]  (n>0)"

	 ^ self propertyAt: 'EvL' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> EvN: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"number of sequences for Viterbi Gumbel mu fit  [200]  (n>0)"

	 ^ self propertyAt: 'EvN' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> F1: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"Stage 1 (MSV) threshold: promote hits w/ P <= F1  [0.02]"

	 ^ self propertyAt: 'F1' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> F2: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"Stage 2 (Vit) threshold: promote hits w/ P <= F2  [1e-3]"

	 ^ self propertyAt: 'F2' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> F3: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"Stage 3 (Fwd) threshold: promote hits w/ P <= F3  [1e-5]"

	 ^ self propertyAt: 'F3' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> T: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"report sequences >= this score threshold in output"

	 ^ self propertyAt: 'T' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> Z: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"set # of comparisons done, for E-value calculation"

	 ^ self propertyAt: 'Z' ifAbsentPut: [ x ]
]

{ #category : #options }
BioHMMERWrapper >> acc [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"prefer accessions over names in output"

	 ^ self addOption: 'acc'
]

{ #category : #properties }
BioHMMERWrapper >> cpu: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:19 pm"

	"number of parallel CPU workers to use for multithreads"

	 ^ self propertyAt: 'cpu' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> domE: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"report domains <= this E-value threshold in output  [10.0]  (x>0)"

	 ^ self propertyAt: 'domE' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> domT: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"report domains >= this score cutoff in output"

	 ^ self propertyAt: 'domT' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> domZ: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"set # of significant seqs, for domain E-value calculation"

	 ^ self propertyAt: 'domZ' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> domtblout: f [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"save parseable table of per-domain hits to file <s>"

	 ^ self propertyAt: 'domtblout' ifAbsentPut: [ f ]
]

{ #category : #options }
BioHMMERWrapper >> help [
	"WARNING: This is code generated automatically.
 On: 14 November 2012 - 1:22:49 am"

	"Print this help and exit"

	 ^ self addOption: 'h'
]

{ #category : #programs }
BioHMMERWrapper >> hmmalign [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmalign'
]

{ #category : #programs }
BioHMMERWrapper >> hmmbuild [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmbuild'
]

{ #category : #programs }
BioHMMERWrapper >> hmmconvert [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmconvert'
]

{ #category : #programs }
BioHMMERWrapper >> hmmemit [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmemit'
]

{ #category : #programs }
BioHMMERWrapper >> hmmfetch [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmfetch'
]

{ #category : #programs }
BioHMMERWrapper >> hmmpress [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:02 pm"

	^ 'hmmpress'
]

{ #category : #programs }
BioHMMERWrapper >> hmmscan [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'hmmscan'
]

{ #category : #programs }
BioHMMERWrapper >> hmmsearch [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'hmmsearch'
]

{ #category : #programs }
BioHMMERWrapper >> hmmsim [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'hmmsim'
]

{ #category : #programs }
BioHMMERWrapper >> hmmstat [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'hmmstat'
]

{ #category : #properties }
BioHMMERWrapper >> incE: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"consider sequences <= this E-value threshold as significant"

	 ^ self propertyAt: 'incE' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> incT: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"consider sequences >= this score threshold as significant"

	 ^ self propertyAt: 'incT' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> incdomE: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"consider domains <= this E-value threshold as significant"

	 ^ self propertyAt: 'incdomE' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> incdomT: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:16 pm"

	"consider domains >= this score threshold as significant"

	 ^ self propertyAt: 'incdomT' ifAbsentPut: [ x ]
]

{ #category : #private }
BioHMMERWrapper >> isExecCygwin [
	" phmmer.exe reports 
	
	cygwin warning:
  MS-DOS style path detected: C:\MySmalltalkProjects\BioSmalltalk\BioSmalltalkTestFiles\globins4.sto
  Preferred POSIX equivalent is: /cygdrive/c/MySmalltalkProjects/BioSmalltalk/BioSmalltalkTestFiles/globins4.sto
  CYGWIN environment variable option 'nodosfilewarning' turns off this warning.
  Consult the user's guide for more details about POSIX paths:
    http://cygwin.com/cygwin-ug-net/using.html#using-pathnames"

	^ true
]

{ #category : #programs }
BioHMMERWrapper >> jackhmmer [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ 'jackhmmer'
]

{ #category : #options }
BioHMMERWrapper >> max [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"Turn all heuristic filters off (less speed, more power)"

	 ^ self addOption: 'max'
]

{ #category : #properties }
BioHMMERWrapper >> mxfile: f [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"substitution score matrix [default: BLOSUM62]"

	 ^ self propertyAt: 'mxfile' ifAbsentPut: [ f ]
]

{ #category : #options }
BioHMMERWrapper >> noali [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"don't output alignments, so output is smaller"

	 ^ self addOption: 'noali'
]

{ #category : #options }
BioHMMERWrapper >> nobias [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:17 pm"

	"turn off composition bias filter"

	 ^ self addOption: 'nobias'
]

{ #category : #options }
BioHMMERWrapper >> nonull2 [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"turn off biased composition score corrections"

	 ^ self addOption: 'nonull2'
]

{ #category : #options }
BioHMMERWrapper >> notextw [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"unlimit ASCII text output line width"

	 ^ self addOption: 'notextw'
]

{ #category : #properties }
BioHMMERWrapper >> o: f [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"direct output to file <f>, not stdout"

	 ^ self propertyAt: 'o' ifAbsentPut: [ f ]
]

{ #category : #properties }
BioHMMERWrapper >> pextend: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"gap extend probability  [0.4]  (0<=x<1)"

	 ^ self propertyAt: 'pextend' ifAbsentPut: [ x ]
]

{ #category : #programs }
BioHMMERWrapper >> phmmer [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ self class phmmer
]

{ #category : #properties }
BioHMMERWrapper >> popen: x [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"gap open probability  [0.02]  (0<=x<0.5)"

	 ^ self propertyAt: 'popen' ifAbsentPut: [ x ]
]

{ #category : #properties }
BioHMMERWrapper >> qformat: s [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"assert query <seqfile> is in format <s>: no autodetection"

	 ^ self propertyAt: 'qformat' ifAbsentPut: [ s ]
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmAlign [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmalign)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmBuild [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmbuild)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmConvert [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmconvert)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmEmit [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmemit)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmFetch [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	^ self programNamed: self hmmfetch
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmPress [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmpress)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmScan [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmscan)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmSearch [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmsearch)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmSim [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmsim)
]

{ #category : #accessing }
BioHMMERWrapper >> runHmmStat [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:03 pm"

	self programName: (self programNamed: self hmmstat)
]

{ #category : #properties }
BioHMMERWrapper >> seed: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:18 pm"

	"set RNG seed to <n> (if 0: one-time arbitrary seed)  [42]"

	 ^ self propertyAt: 'seed' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> tblout: f [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:14 pm"

	"save parseable table of per-sequence hits to file <s>"

	 ^ self propertyAt: 'tblout' ifAbsentPut: [ f ]
]

{ #category : #properties }
BioHMMERWrapper >> textw: n [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:15 pm"

	"set max width of ASCII text output lines  [120]  (n>=120)"

	 ^ self propertyAt: 'textw' ifAbsentPut: [ n ]
]

{ #category : #properties }
BioHMMERWrapper >> tformat: s [
	"WARNING: This is code generated automatically.
 On: 6 December 2012 - 6:34:19 pm"

	"assert target <seqdb> is in format <s>>: no autodetection"

	 ^ self propertyAt: 'tformat' ifAbsentPut: [ s ]
]
