Class {
	#name : 'BioInterProScanWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioInterProScanWrapperTest >> testCategory [

	self
		assert: BioInterProScanWrapper category
		equals: 'Protein Functional Analysis'
]

{ #category : 'tests' }
BioInterProScanWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioInterProScanWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioInterProScanWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioInterProScanWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioInterProScanWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioInterProScanWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
