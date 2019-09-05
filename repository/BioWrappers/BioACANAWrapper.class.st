"
ACANA is an accurate and consistent alignment tool for DNA sequences. ACANA is specifically designed for aligning sequences that share only some moderately conserved regions and/or have a high frequency of long insertions or deletions. It attempts to combine the best of local and global alignments algorithms in searching for evolutionarily related regions of sequences in order to achieve the best alignment. ACANA is also robust to the small changes of alignment parameters, particularly the gap extension score. As an accurate alignment tool, ACANA is particularly useful in comparative sequence analysis for identifying conserved functional regulatory elements.

To use this wrapper, install the software into any directory accessible by the PATH variable.
To see current PATH locations for your system.

Windows: 
NBWin32Shell getPathEntries

Unix:

MacOS:



"
Class {
	#name : #BioACANAWrapper,
	#superclass : #BioWrapperObject,
	#category : 'BioWrappers-Programs'
}

{ #category : #accessing }
BioACANAWrapper class >> availablePlatforms [
	" Private - See superimplementor's comment "
	
	^ #('Unix' 'MacOS' 'Win32')
]

{ #category : #examples }
BioACANAWrapper class >> example1 [

	| fastaFile |
	
	fastaFile := (self testFilesFullDirectoryName / 'acana' / 'acana_test.fa') fullName.
	^ BioACANAWrapper new
			runAcana;
			inSeqFile: fastaFile;
			execute.
]

{ #category : #examples }
BioACANAWrapper class >> example2 [

	| fastaFile |
	
	fastaFile := ''.
	^ BioACANAWrapper new
			runAcana2;
			inSeqFile: fastaFile;
			execute.

]

{ #category : #accessing }
BioACANAWrapper class >> url [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:11 pm"

	^ 'http://www.niehs.nih.gov/research/resources/software/biostatistics/acana/'
]

{ #category : #programs }
BioACANAWrapper >> acana [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:11 pm"

	^ 'acana'
]

{ #category : #programs }
BioACANAWrapper >> acana2 [
	"WARNING: This is code generated automatically.
 On: 8 November 2012 - 9:58:11 pm"

	^ 'acana2'
]

{ #category : #properties }
BioACANAWrapper >> affineGapPenality: aNumber [ 
	" Set The affine gap penalty (default: -25) to be aNumber "

	self propertyAt: 'A' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioACANAWrapper >> inSeqFile: aFileReference [ 
	" Set Input sequence file in FASTA format to be aFileReference "

	self propertyAt: 'I' ifAbsentPut: [ aFileReference ]
]

{ #category : #properties }
BioACANAWrapper >> minCutoffFactor: aNumber [ 
	" Set The factor for increasing minium local alignment cutoff (default: 10) to be aNumber "

	self propertyAt: 'T' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioACANAWrapper >> minLength: aNumber [ 
	" Set The minimum length of local alignment (default: 100) to be aNumber "

	self propertyAt: 'C' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioACANAWrapper >> openGapPenality: aNumber [ 
	" Set The opening gap penalty (default: -500) to be aNumber "

	self propertyAt: 'G' ifAbsentPut: [ aNumber ]
]

{ #category : #properties }
BioACANAWrapper >> outputFilename: aString [ 
	" Set The scoring matrix file name to be aString "

	self propertyAt: 'O' ifAbsentPut: [ aString ]
]

{ #category : #'accessing-private' }
BioACANAWrapper >> propertySeparator [
	" Private - See superclass comment "

	^ Character space
]

{ #category : #accessing }
BioACANAWrapper >> runAcana [

	self programName: (self programNamed: self acana)
]

{ #category : #accessing }
BioACANAWrapper >> runAcana2 [

	self programName: (self programNamed: self acana2)
]

{ #category : #properties }
BioACANAWrapper >> scoringMatrix: aFileReference [ 
	" Set The scoring matrix file name (default: dnaMatrix) to be aFileReference "

	self propertyAt: 'S' ifAbsentPut: [ aFileReference ]
]
