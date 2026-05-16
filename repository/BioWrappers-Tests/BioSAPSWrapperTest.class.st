Class {
	#name : 'BioSAPSWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioSAPSWrapperTest >> testCategory [

	self assert: BioSAPSWrapper category equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioSAPSWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioSAPSWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioSAPSWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioSAPSWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioSAPSWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioSAPSWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
