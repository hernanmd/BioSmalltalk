Class {
	#name : 'BioEMBOSSDotpathWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSDotpathWrapperTest >> testCategory [

	self
		assert: BioEMBOSSDotpathWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSDotpathWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSDotpathWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSDotpathWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSDotpathWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSDotpathWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSDotpathWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
