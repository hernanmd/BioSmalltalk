Class {
	#name : 'BioShapeIt2WrapperR644Test',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioShapeIt2WrapperR644Test >> testCategory [

	self
		assert: BioShapeIt2WrapperR644 category
		equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioShapeIt2WrapperR644Test >> testInheritsFromBioShapeIt2Wrapper [

	self
		assert: BioShapeIt2WrapperR644 superclass
		equals: BioShapeIt2Wrapper
]
