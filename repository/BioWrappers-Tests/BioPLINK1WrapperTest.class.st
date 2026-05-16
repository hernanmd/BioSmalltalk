Class {
	#name : 'BioPLINK1WrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPLINK1WrapperTest >> testCategory [

	self assert: BioPLINK1Wrapper category equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioPLINK1WrapperTest >> testDefaultProgramName [

	self assert:
		(BioPLINK1Wrapper new defaultProgramName includesSubstring: 'plink')
]

{ #category : 'tests' }
BioPLINK1WrapperTest >> testInheritsFromBioPLINKWrapper [

	self assert: BioPLINK1Wrapper superclass equals: BioPLINKWrapper
]

{ #category : 'tests' }
BioPLINK1WrapperTest >> testNoWebOption [

	| wrapper |
	wrapper := BioPLINK1Wrapper new noWeb.
	self assert: wrapper isNotNil
]
