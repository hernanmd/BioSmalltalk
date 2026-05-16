"
Test class for BioMAFFTWrapper. Validates MAFFT multiple sequence alignment wrapper behavior.
"
Class {
	#name : 'BioMAFFTWrapperTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioMAFFTWrapperTest >> testAdjustDirection [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper adjustDirection.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--adjustdirection')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testAutoStrategy [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--auto').
	self assert: (cmd includesSubstring: 'input.fasta')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testClustalOutput [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper input: 'input.fasta'.
	wrapper clustalout.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--clustalout')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testCmdLineNoOptions [
	"Without any strategy option, MAFFT uses FFT-NS-2 by default"

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: 'mafft').
	self assert: (cmd includesSubstring: 'input.fasta')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testDefaultProgramName [

	self assert: BioMAFFTWrapper defaultProgramName equals: 'mafft'
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testEinsiStrategy [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper einsi.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--genafpair').
	self assert: (cmd includesSubstring: '--maxiterate 1000')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testExecuteAuto [
	"Test MAFFT execution with --auto strategy using real data"

	| wrapper result |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper input: self testFilesFullDirectoryName pathString , 'ls_orchid.fasta'.
	wrapper out: '/tmp/mafft_auto_test5.fasta'.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'mafft')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testExecuteClustal [
	"Test MAFFT execution with --auto --clustalout"

	| wrapper result |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper clustalout.
	wrapper input: self testFilesFullDirectoryName pathString , 'ls_orchid.fasta'.
	wrapper out: '/tmp/mafft_clustal_test3.aln'.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'mafft')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testFftns2Strategy [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper fftns2.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--retree 2')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testGapPenalty [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper gapOpeningPenalty: 2.0.
	wrapper offsetValue: 0.5.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--op 2.0').
	self assert: (cmd includesSubstring: '--ep 0.5')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testGinsiStrategy [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper ginsi.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--globalpair').
	self assert: (cmd includesSubstring: '--maxiterate 1000')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioMAFFTWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testLinsiStrategy [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper linsi.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--localpair').
	self assert: (cmd includesSubstring: '--maxiterate 1000')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testMaxiterate [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper maxiterate: 500.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--maxiterate 500')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testNucleotideMatrix [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper matrixKimura200.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--scorematrixnuc 200')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testOutputRedirection [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper input: 'input.fasta'.
	wrapper out: 'output.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '> output.fasta').
	self deny: (cmd includesSubstring: '--out')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testOutputRedirectionNotInFlags [
	"The out file should not appear as a --flag, only as > redirection"

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper input: 'input.fasta'.
	wrapper out: 'output.fasta'.
	cmd := wrapper cmdLine.
	self deny: (cmd includesSubstring: '--out')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testProteinMatrix [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper matrixBLOSUM62.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--scorematrix BL62')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testQuiet [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper quiet.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--quiet')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testReorderAndTreeout [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper reorder.
	wrapper treeOut.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--reorder').
	self assert: (cmd includesSubstring: '--treeout')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testRetree [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper retree: 1.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--retree 1')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testThreadOption [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper auto.
	wrapper thread: 4.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--thread 4')
]

{ #category : 'tests' }
BioMAFFTWrapperTest >> testUnalignLevel [

	| wrapper cmd |
	wrapper := BioMAFFTWrapper new.
	wrapper unalignLevel: 0.5.
	wrapper input: 'input.fasta'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--unalignlevel 0.5')
]
