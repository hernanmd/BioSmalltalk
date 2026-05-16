Class {
	#name : 'BioEMBOSSNewcpgreportWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSNewcpgreportWrapperTest >> testCategory [

	self
		assert: BioEMBOSSNewcpgreportWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSNewcpgreportWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSNewcpgreportWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSNewcpgreportWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSNewcpgreportWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSNewcpgreportWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSNewcpgreportWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
