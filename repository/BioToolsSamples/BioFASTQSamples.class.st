"
I provide access to FASTQ test sample files for the BioSmalltalk test suite.

Test files are located in the BioSmalltalkTestFiles/fastq_files directory.

Usage:
BioFASTQSamples sangerFullRangeFilename.
BioFASTQSamples illuminaFullRangeFilename.
BioFASTQSamples longreadsSangerFilename.
"
Class {
	#name : 'BioFASTQSamples',
	#superclass : 'BioSamples',
	#category : 'BioToolsSamples-Core',
	#package : 'BioToolsSamples',
	#tag : 'Core'
}

{ #category : 'accessing' }
BioFASTQSamples >> allSangerFilenames [
	" Answer a <Collection> of all Sanger-encoded test file paths "

	^ Array
		  with: self sangerFullRangeFilename
		  with: self miscDnaSangerFilename
		  with: self miscRnaSangerFilename
		  with: self longreadsSangerFilename
		  with: self wrappingSangerFilename
]

{ #category : 'accessing' }
BioFASTQSamples >> allValidFilenames [
	" Answer a <Collection> of all valid (non-error) test file paths "

	^ self allSangerFilenames , (Array
		   with: self illuminaFullRangeFilename
		   with: self solexaFullRangeFilename)
]

{ #category : 'accessing' }
BioFASTQSamples >> fullPathFor: aFilename [
	" Answer a <String> with the full path for aFilename in the test files directory "

	^ String streamContents: [ : stream |
		stream 
			<< self testFilesDirectoryName;
			<< 	File delimiter;
			<< aFilename ]
]

{ #category : 'accessing-illumina' }
BioFASTQSamples >> illuminaFullRangeFilename [
	" Answer a <String> with the Illumina full range test file "

	^ self fullPathFor: 'illumina_full_range_as_illumina.fastq'
]

{ #category : 'accessing-illumina' }
BioFASTQSamples >> illuminaFullRangeOriginalFilename [
	" Answer a <String> with the original Illumina full range test file "

	^ self fullPathFor: 'illumina_full_range_original_illumina.fastq'
]

{ #category : 'accessing-longreads' }
BioFASTQSamples >> longreadsOriginalSangerFilename [
	" Answer a <String> with the original long reads Sanger test file "

	^ self fullPathFor: 'longreads_original_sanger.fastq'
]

{ #category : 'accessing-longreads' }
BioFASTQSamples >> longreadsSangerFilename [
	" Answer a <String> with the long reads Sanger test file "

	^ self fullPathFor: 'longreads_as_sanger.fastq'
]

{ #category : 'accessing-misc' }
BioFASTQSamples >> miscDnaSangerFilename [
	" Answer a <String> with a miscellaneous DNA Sanger-encoded test file "

	^ self fullPathFor: 'misc_dna_as_sanger.fastq'
]

{ #category : 'accessing-misc' }
BioFASTQSamples >> miscRnaSangerFilename [
	" Answer a <String> with a miscellaneous RNA Sanger-encoded test file "

	^ self fullPathFor: 'misc_rna_as_sanger.fastq'
]

{ #category : 'accessing-sanger' }
BioFASTQSamples >> sangerFullRangeFilename [
	" Answer a <String> with the Sanger full range test file name (Phred 0-93) "

	^ self fullPathFor: 'sanger_full_range_as_sanger.fastq'
]

{ #category : 'accessing-sanger' }
BioFASTQSamples >> sangerFullRangeOriginalFilename [
	" Answer a <String> with the original Sanger full range test file name "

	^ self fullPathFor: 'sanger_full_range_original_sanger.fastq'
]

{ #category : 'accessing-solexa' }
BioFASTQSamples >> solexaFullRangeFilename [
	" Answer a <String> with the Solexa full range test file "

	^ self fullPathFor: 'solexa_full_range_as_solexa.fastq'
]

{ #category : 'testing' }
BioFASTQSamples >> testFilesDirectoryName [
	" Answer a <String> with the directory name containing FASTQ test files "

	^ (super testFilesDirectoryName asFileReference / 'fastq_files') fullName
]

{ #category : 'accessing-misc' }
BioFASTQSamples >> wrappingSangerFilename [
	" Answer a <String> with the wrapping Sanger test file "

	^ self fullPathFor: 'wrapping_as_sanger.fastq'
]
