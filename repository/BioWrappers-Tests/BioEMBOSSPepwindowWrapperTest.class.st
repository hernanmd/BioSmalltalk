Class {
	#name : 'BioEMBOSSPepwindowWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSPepwindowWrapperTest >> testCategory [

	self
		assert: BioEMBOSSPepwindowWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSPepwindowWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSPepwindowWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSPepwindowWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSPepwindowWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSPepwindowWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSPepwindowWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
