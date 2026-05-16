Class {
	#name : 'BioPfamScanWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPfamScanWrapperTest >> testCategory [

	self
		assert: BioPfamScanWrapper category
		equals: 'Protein Functional Analysis'
]

{ #category : 'tests' }
BioPfamScanWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioPfamScanWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioPfamScanWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioPfamScanWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioPfamScanWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioPfamScanWrapper new.
	wrapper outfile: 'test_output.txt'.
	self assert: wrapper isNotNil
]
