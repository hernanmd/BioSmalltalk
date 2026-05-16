Class {
	#name : 'BioAGAWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioAGAWrapperTest >> testCategory [

	self assert: BioAGAWrapper category equals: #'BioWrappers-Aligners'
]

{ #category : 'tests' }
BioAGAWrapperTest >> testDefaultProgramName [

	self assert: BioAGAWrapper new defaultProgramName equals: 'aga'
]

{ #category : 'tests' }
BioAGAWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioAGAWrapper superclass equals: BioWrapperObject
]
