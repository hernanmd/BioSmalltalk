Class {
	#name : 'BioGbk2FasWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioGbk2FasWrapperTest >> testCategory [

	self
		assert: BioGbk2FasWrapper category
		equals: #'BioWrappers-Programs'
]

{ #category : 'tests' }
BioGbk2FasWrapperTest >> testDefaultProgramName [

	self assert: BioGbk2FasWrapper new defaultProgramName isNotNil
]

{ #category : 'tests' }
BioGbk2FasWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioGbk2FasWrapper superclass equals: BioWrapperObject
]
