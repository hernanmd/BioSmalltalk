Class {
	#name : 'BioEMBOSSIsochoreWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSIsochoreWrapperTest >> testCategory [

	self
		assert: BioEMBOSSIsochoreWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSIsochoreWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSIsochoreWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSIsochoreWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSIsochoreWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSIsochoreWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSIsochoreWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
