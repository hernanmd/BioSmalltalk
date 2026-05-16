Class {
	#name : 'BioGenePopWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioGenePopWrapperTest >> testBootstrapMethod [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper bootstrapMethodBCa.
	self
		assert: (wrapper propertyAt: 'BootstrapMethod' ifAbsent: [ nil ])
		equals: 'BCa'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testCICoverageAndTestPoint [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper ciCoverage: 0.99.
	wrapper testPoint: 0.00123.
	self
		assert: (wrapper propertyAt: 'CIcoverage' ifAbsent: [ nil ])
		equals: 0.99.
	self
		assert: (wrapper propertyAt: 'testPoint' ifAbsent: [ nil ])
		equals: 0.00123
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testCategory [

	self assert: BioGenePopWrapper category equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testCmdLineGeneration [

	| wrapper cmd |
	wrapper := BioGenePopWrapper new.
	wrapper inputFile: 'sample.txt'.
	wrapper menuOptions: '1.1'.
	wrapper modeBatch.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: 'Genepop').
	self assert: (cmd includesSubstring: 'InputFile=').
	self assert: (cmd includesSubstring: 'MenuOptions=1.1').
	self assert: (cmd includesSubstring: 'Mode=Batch')
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testCmdLineNoDashPrefix [
	"Genepop uses Key=Value format without dash prefix"

	| wrapper cmd |
	wrapper := BioGenePopWrapper new.
	wrapper inputFile: 'data.txt'.
	wrapper menuOptions: '6.1'.
	wrapper modeBatch.
	cmd := wrapper cmdLine.
	self deny: (cmd includesSubstring: '-InputFile=').
	self deny: (cmd includesSubstring: '--InputFile=')
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testDefaultProgramName [

	self
		assert: BioGenePopWrapper new defaultProgramName
		equals: 'Genepop'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testDifferentiationSettings [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper differentiationTestGeneDiv.
	self
		assert:
		(wrapper propertyAt: 'DifferentiationTest' ifAbsent: [ nil ])
		equals: 'GeneDiv'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testExecuteFStatistics [
	" Test that Genepop FST analysis executes via the wrapper "

	| wrapper result |
	wrapper := BioGenePopWrapper new.
	wrapper programName: '/Users/mvs/.local/bin/Genepop'.
	wrapper inputFile: '/tmp/genepop_sample.txt'.
	wrapper menuOptions: '6.1'.
	wrapper modeBatch.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'Genepop')
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testExecuteHardyWeinberg [
	" Test that Genepop can be executed via the wrapper "

	| wrapper result |
	wrapper := BioGenePopWrapper new.
	wrapper programName: 'Genepop'.
	wrapper inputFile: '/tmp/genepop_sample.txt'.
	wrapper menuOptions: '1.1'.
	wrapper modeBatch.
	result := wrapper execute.
	self assert: result isNotNil.
	self assert: (result result includesSubstring: 'Genepop')
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testFStatisticsCmdLine [

	| wrapper cmd |
	wrapper := BioGenePopWrapper new.
	wrapper inputFile: 'populations.txt'.
	wrapper fStatisticsAll.
	wrapper modeBatch.
	cmd := wrapper cmdLine.
	self assert: (cmd includesSubstring: 'MenuOptions=6.1').
	self assert: (cmd includesSubstring: 'Mode=Batch')
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testHWTestsEnumeration [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper hwTestsEnumeration.
	self
		assert: (wrapper propertyAt: 'HWtests' ifAbsent: [ nil ])
		equals: 'Enumeration'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testHardyWeinbergDeficiency [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper hardyWeinbergDeficiency.
	self
		assert: (wrapper propertyAt: 'MenuOptions' ifAbsent: [ nil ])
		equals: '1.1'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioGenePopWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testInputFile [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper inputFile: 'sample.txt'.
	self assert:
		(wrapper propertyAt: 'InputFile' ifAbsent: [ nil ]) isNotNil
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testIsolationByDistanceSettings [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper isolationStatisticA.
	wrapper geographicScaleLog.
	self
		assert: (wrapper propertyAt: 'IsolationStatistic' ifAbsent: [ nil ])
		equals: 'a'.
	self
		assert: (wrapper propertyAt: 'GeographicScale' ifAbsent: [ nil ])
		equals: 'Log'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testMCMCParameters [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper dememorisation: 10000.
	wrapper batchNumber: 100.
	wrapper batchLength: 5000.
	self
		assert: (wrapper propertyAt: 'Dememorisation' ifAbsent: [ nil ])
		equals: 10000.
	self
		assert: (wrapper propertyAt: 'BatchNumber' ifAbsent: [ nil ])
		equals: 100.
	self
		assert: (wrapper propertyAt: 'BatchLength' ifAbsent: [ nil ])
		equals: 5000
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testMenuOptions [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper menuOptions: '1.1'.
	self
		assert: (wrapper propertyAt: 'MenuOptions' ifAbsent: [ nil ])
		equals: '1.1'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testModeBatch [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper modeBatch.
	self
		assert: (wrapper propertyAt: 'Mode' ifAbsent: [ nil ])
		equals: 'Batch'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testNullAlleleMethod [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper nullAlleleMethodApparentNulls.
	self
		assert: (wrapper propertyAt: 'NullAlleleMethod' ifAbsent: [ nil ])
		equals: 'ApparentNulls'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testPloidySettings [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper estimationPloidyHaploid.
	self
		assert: (wrapper propertyAt: 'EstimationPloidy' ifAbsent: [ nil ])
		equals: 'Haploid'
]

{ #category : 'tests' }
BioGenePopWrapperTest >> testSettingsFile [

	| wrapper |
	wrapper := BioGenePopWrapper new.
	wrapper settingsFile: 'genepop.settings'.
	self assert:
		(wrapper propertyAt: 'settingsFile' ifAbsent: [ nil ]) isNotNil
]
