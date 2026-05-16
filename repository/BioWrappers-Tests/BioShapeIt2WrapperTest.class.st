Class {
	#name : 'BioShapeIt2WrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioShapeIt2WrapperTest >> testCategory [

	self
		assert: BioShapeIt2Wrapper category
		equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioShapeIt2WrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioShapeIt2Wrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioShapeIt2WrapperTest >> testParameters [

	| wrapper |
	wrapper := BioShapeIt2Wrapper new.
	wrapper
		burn: 500;
		thread: 4.
	self assert: wrapper isNotNil
]
