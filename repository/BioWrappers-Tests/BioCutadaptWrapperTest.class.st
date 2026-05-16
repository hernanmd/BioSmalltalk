Class {
	#name : 'BioCutadaptWrapperTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioCutadaptWrapperTest >> testActionParameter [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper action: 'mask'.
	self
		assert: (wrapper propertyAt: 'action' ifAbsent: [ nil ])
		equals: 'mask'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testAdapter3Prime [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'AGATCGGAAGAGC'.
	self
		assert: (wrapper propertyAt: 'a' ifAbsent: [ nil ])
		equals: 'AGATCGGAAGAGC'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testAdapter3PrimeAnchored [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3PrimeAnchored: 'AGATCGGAAGAGC'.
	self
		assert: (wrapper propertyAt: 'a' ifAbsent: [ nil ])
		equals: 'AGATCGGAAGAGC$'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testAdapter5Prime [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter5Prime: 'GTGTCGTGTAGAG'.
	self
		assert: (wrapper propertyAt: 'g' ifAbsent: [ nil ])
		equals: 'GTGTCGTGTAGAG'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testAdapter5PrimeAnchored [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter5PrimeAnchored: 'GTGTCGT'.
	self
		assert: (wrapper propertyAt: 'g' ifAbsent: [ nil ])
		equals: '^GTGTCGT'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testAdapterAnywhere [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter: 'AGATCGGAAGAGC'.
	self
		assert: (wrapper propertyAt: 'b' ifAbsent: [ nil ])
		equals: 'AGATCGGAAGAGC'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testBioFASTQSamples [
	"Verify sample file accessors work"

	self assert: BioFASTQSamples new sangerFullRangeFilename isNotNil.
	self assert:
		(BioFASTQSamples new sangerFullRangeFilename includesSubstring:
			 'sanger_full_range').
	self assert: BioFASTQSamples new miscDnaSangerFilename isNotNil.
	self assert:
		(BioFASTQSamples new miscDnaSangerFilename includesSubstring:
			 'misc_dna')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testCmdLineBasic [

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'AGATCGGAAGAGC'.
	wrapper input: 'reads.fastq'.
	wrapper out: 'trimmed.fastq'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: 'cutadapt').
	self assert: (cmd includesSubstring: '-a AGATCGGAAGAGC').
	self assert: (cmd includesSubstring: '-o trimmed.fastq').
	self assert: (cmd includesSubstring: 'reads.fastq')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testCmdLineLongFlags [
	"Long flags use --flag=VALUE format (= separator)"

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper qualityBase: 64.
	wrapper maximumExpectedErrors: 1.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--quality-base=64').
	self assert: (cmd includesSubstring: '--max-expected-errors=1')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testCmdLineNoDoubleDashShortFlags [
	"Short flags must not get double-dash prefix"

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper out: 'out.fq'.
	cmd := wrapper cmdLine.
	self deny: (cmd includesSubstring: '--a').
	self deny: (cmd includesSubstring: '--o').
	self assert: (cmd includesSubstring: '-a').
	self assert: (cmd includesSubstring: '-o')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testCmdLineShortFlags [
	"Short flags use -X VALUE format (space separator)"

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper minimumLength: 20.
	wrapper errorRate: 0.15.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-m 20').
	self assert: (cmd includesSubstring: '-e 0.15')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testCores [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper cores: 4.
	self assert: (wrapper propertyAt: 'j' ifAbsent: [ nil ]) equals: 4
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testDefaultProgramName [
	"The class-side defaultProgramName answers the bare program name"

	self assert: BioCutadaptWrapper defaultProgramName equals: 'cutadapt'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testDiscardOptions [

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper discardTrimmed.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--discard-trimmed')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testExecuteBasic [
	"Test basic cutadapt execution with real binary and test data"

	| wrapper result |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'AGATCGGAAGAGC'.
	wrapper input: BioFASTQSamples new miscDnaSangerFilename.
	wrapper out: '/tmp/cutadapt_test_out.fq'.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'cutadapt')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testExecuteQualityTrim [
	"Test cutadapt with quality trimming"

	| wrapper result |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'AGATCGGAAGAGC'.
	wrapper input: BioFASTQSamples new wrappingSangerFilename.
	wrapper out: '/tmp/cutadapt_test_qual.fq'.
	wrapper qualityCutoff: 20.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'cutadapt')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testExecuteWithFiltering [
	"Test cutadapt execution with quality filtering"

	| wrapper result |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'AGATCGGAAGAGC'.
	wrapper input: BioFASTQSamples new miscDnaSangerFilename.
	wrapper out: '/tmp/cutadapt_test_filtered.fq'.
	wrapper minimumLength: 10.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'Total reads processed')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testFilteringOptions [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper maximumLength: 150.
	wrapper minimumLength: 20.
	self assert: (wrapper propertyAt: 'M' ifAbsent: [ nil ]) equals: 150.
	self assert: (wrapper propertyAt: 'm' ifAbsent: [ nil ]) equals: 20
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioCutadaptWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testLinkedAdapter [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper adapterLink: 'ADAPT1' to: 'ADAPT2'.
	self
		assert: (wrapper propertyAt: 'a' ifAbsent: [ nil ])
		equals: 'ADAPT1...ADAPT2'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testMatchReadWildcards [

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper matchReadWildcards.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--match-read-wildcards')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testMinimumOverlapLength [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper minimumOverlapLength: 5.
	self assert: (wrapper propertyAt: 'O' ifAbsent: [ nil ]) equals: 5
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testOutputOptions [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper quiet.
	wrapper outputFasta.
	wrapper jsonReport: 'report.json'.
	self
		assert: (wrapper propertyAt: 'json' ifAbsent: [ nil ])
		equals: 'report.json'
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testPairedEnd [

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPT1'.
	wrapper adapter3PrimeR2: 'ADAPT2'.
	wrapper out: 'out_R1.fq'.
	wrapper pairedOutput: 'out_R2.fq'.
	wrapper input: 'in_R1.fq'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-a ADAPT1').
	self assert: (cmd includesSubstring: '-A ADAPT2').
	self assert: (cmd includesSubstring: '-p out_R2.fq')
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testRemoveBases [

	| wrapper |
	wrapper := BioCutadaptWrapper new.
	wrapper removeBases: 5.
	self assert: (wrapper propertyAt: 'u' ifAbsent: [ nil ]) equals: 5
]

{ #category : 'tests' }
BioCutadaptWrapperTest >> testRevcomp [

	| wrapper cmd |
	wrapper := BioCutadaptWrapper new.
	wrapper adapter3Prime: 'ADAPTER'.
	wrapper input: 'in.fq'.
	wrapper revcomp.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--rc')
]
