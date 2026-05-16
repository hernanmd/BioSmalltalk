Class {
	#name : 'BioEMBOSSCpgplotWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSCpgplotWrapperTest >> testCategory [

	self
		assert: BioEMBOSSCpgplotWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSCpgplotWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSCpgplotWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSCpgplotWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSCpgplotWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSCpgplotWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSCpgplotWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
