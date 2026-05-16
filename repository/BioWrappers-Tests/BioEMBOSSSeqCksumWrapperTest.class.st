Class {
	#name : 'BioEMBOSSSeqCksumWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSSeqCksumWrapperTest >> testCategory [

	self
		assert: BioEMBOSSSeqCksumWrapper category
		equals: 'Sequence Operations'
]

{ #category : 'tests' }
BioEMBOSSSeqCksumWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSSeqCksumWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSSeqCksumWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSSeqCksumWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSSeqCksumWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSSeqCksumWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
