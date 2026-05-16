Class {
	#name : 'BioEMBOSSSeqretWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSSeqretWrapperTest >> testCategory [

	self
		assert: BioEMBOSSSeqretWrapper category
		equals: 'Sequence Format Conversion'
]

{ #category : 'tests' }
BioEMBOSSSeqretWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSSeqretWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSSeqretWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSSeqretWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSSeqretWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSSeqretWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
