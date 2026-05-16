Class {
	#name : 'BioEMBOSSPolydotWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSPolydotWrapperTest >> testCategory [

	self
		assert: BioEMBOSSPolydotWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSPolydotWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSPolydotWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSPolydotWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSPolydotWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSPolydotWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSPolydotWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
