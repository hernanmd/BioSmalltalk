Class {
	#name : 'BioEMBOSSDottupWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSDottupWrapperTest >> testCategory [

	self
		assert: BioEMBOSSDottupWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSDottupWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSDottupWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSDottupWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSDottupWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSDottupWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSDottupWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
