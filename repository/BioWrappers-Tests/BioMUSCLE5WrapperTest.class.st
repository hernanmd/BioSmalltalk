Class {
	#name : 'BioMUSCLE5WrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioMUSCLE5WrapperTest >> testCategory [

	self
		assert: BioMUSCLE5Wrapper category
		equals: 'Multiple Sequence Alignment'
]

{ #category : 'tests' }
BioMUSCLE5WrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioMUSCLE5Wrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioMUSCLE5WrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioMUSCLE5Wrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioMUSCLE5WrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioMUSCLE5Wrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
