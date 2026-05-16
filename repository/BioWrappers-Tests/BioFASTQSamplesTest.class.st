Class {
	#name : 'BioFASTQSamplesTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioFASTQSamplesTest >> testAllSangerFilenames [

	| files |
	files := BioFASTQSamples new allSangerFilenames.
	self assert: files size >= 5
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testAllValidFilenames [

	| files |
	files := BioFASTQSamples new allValidFilenames.
	self assert: files size >= 7
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testIlluminaFullRangeFilename [

	| filename |
	filename := BioFASTQSamples new illuminaFullRangeFilename.
	self assert: (filename includesSubstring: 'illumina').
	self assert: (filename includesSubstring: '.fastq')
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testInheritsFromBioSamples [

	self assert: BioFASTQSamples superclass equals: BioSamples
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testLongreadsSangerFilename [

	| filename |
	filename := BioFASTQSamples new longreadsSangerFilename.
	self assert: (filename includesSubstring: 'longreads').
	self assert: (filename includesSubstring: '.fastq')
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testMiscDnaSangerFilename [

	| filename |
	filename := BioFASTQSamples new miscDnaSangerFilename.
	self assert: (filename includesSubstring: 'misc_dna').
	self assert: (filename includesSubstring: '.fastq')
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testSangerFullRangeFilename [

	| filename |
	filename := BioFASTQSamples new sangerFullRangeFilename.
	self assert: (filename includesSubstring: 'sanger_full_range').
	self assert: (filename includesSubstring: '.fastq')
]

{ #category : 'tests' }
BioFASTQSamplesTest >> testTestFilesDirectoryName [

	self assert:
		(BioFASTQSamples new testFilesDirectoryName includesSubstring:
			 'fastq_files')
]
