Class {
	#name : 'BioMultiQCWrapperTest',
	#superclass : 'BioAbstractTest',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioMultiQCWrapperTest >> testAIOptions [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper ai.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--ai')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testAIProvider [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper aiProvider: 'openai'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--ai-provider=openai')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testAnalysisDirectory [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data/results'.
	self assert: wrapper parameters first equals: '/data/results'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testCmdLineBasic [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data/results'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: 'multiqc').
	self assert: (cmd includesSubstring: '/data/results')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testCmdLineLongFlags [
	"Long flags use --flag=VALUE format"

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper clConfig: 'key: value'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--cl-config=key: value')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testCmdLineShortFlags [
	"Short flags use -X VALUE format"

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper filename: 'report.html'.
	cmd := wrapper cmdLine.
	self deny: (cmd includesSubstring: '--n=').
	self assert: (cmd includesSubstring: '-n report.html')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testCmdLineWithOptions [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data/results'.
	wrapper outdir: './report'.
	wrapper force.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-o ./report').
	self assert: (cmd includesSubstring: '-f').
	self assert: (cmd includesSubstring: '/data/results')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testConfigFile [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper configFile: '/path/to/config.yaml'.
	self
		assert: (wrapper propertyAt: 'c' ifAbsent: [ nil ])
		equals: '/path/to/config.yaml'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testDataFormat [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper dataFormat: 'json'.
	self
		assert: (wrapper propertyAt: 'k' ifAbsent: [ nil ])
		equals: 'json'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testDefaultProgramName [

	self assert: BioMultiQCWrapper defaultProgramName equals: 'multiqc'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testExclude [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper exclude: 'fastqc'.
	wrapper analysisDirectory: '/data'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-e fastqc')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testExecuteNoResults [
	"Test that multiqc can be executed via the wrapper (may find no results)"

	| wrapper result |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/tmp/multiqc_test_data'.
	wrapper outdir: '/tmp/mqc_wrapper_test'.
	wrapper force.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'multiqc')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testExport [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper export.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-p')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testForce [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper force.
	self assert: (wrapper options includes: 'f')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioMultiQCWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testModuleSelection [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper module: 'cutadapt'.
	wrapper analysisDirectory: '/data'.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-m cutadapt')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testNoReport [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper noReport.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--no-report')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testOutdir [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper outdir: './report'.
	self
		assert: (wrapper propertyAt: 'o' ifAbsent: [ nil ])
		equals: './report'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testPDF [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper pdf.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '--pdf')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testQuiet [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper quiet.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-q')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testSampleHandling [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper dirs.
	wrapper fullnames.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-d').
	self assert: (cmd includesSubstring: '-s')
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testTitle [

	| wrapper |
	wrapper := BioMultiQCWrapper new.
	wrapper title: 'QC Report'.
	self
		assert: (wrapper propertyAt: 'i' ifAbsent: [ nil ])
		equals: 'QC Report'
]

{ #category : 'tests' }
BioMultiQCWrapperTest >> testZipDataDir [

	| wrapper cmd |
	wrapper := BioMultiQCWrapper new.
	wrapper analysisDirectory: '/data'.
	wrapper zipDataDir.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: '-z')
]
