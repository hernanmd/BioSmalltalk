Class {
	#name : 'BioPhobiusWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPhobiusWrapperTest >> testCategory [

	self
		assert: BioPhobiusWrapper category
		equals: 'Protein Functional Analysis'
]

{ #category : 'tests' }
BioPhobiusWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioPhobiusWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioPhobiusWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioPhobiusWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioPhobiusWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioPhobiusWrapper new.
	wrapper input: 'test_input.fasta'.
	self assert: wrapper isNotNil
]
