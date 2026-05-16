Class {
	#name : 'BioShapeIt2WrapperR727Test',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioShapeIt2WrapperR727Test >> testCategory [

	self
		assert: BioShapeIt2WrapperR727 category
		equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioShapeIt2WrapperR727Test >> testInheritsFromBioShapeIt2Wrapper [

	self
		assert: BioShapeIt2WrapperR727 superclass
		equals: BioShapeIt2Wrapper
]
