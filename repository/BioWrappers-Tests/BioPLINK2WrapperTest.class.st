Class {
	#name : 'BioPLINK2WrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPLINK2WrapperTest >> testCategory [

	self assert: BioPLINK2Wrapper category equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioPLINK2WrapperTest >> testDefaultProgramName [

	self assert:
		(BioPLINK2Wrapper new defaultProgramName includesSubstring: 'plink2')
]

{ #category : 'tests' }
BioPLINK2WrapperTest >> testInheritsFromBioPLINKWrapper [

	self assert: BioPLINK2Wrapper superclass equals: BioPLINKWrapper
]
