Class {
	#name : 'BioInfernalWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioInfernalWrapperTest >> testCategory [

	self assert: BioInfernalWrapper category equals: 'RNA Analysis'
]

{ #category : 'tests' }
BioInfernalWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioInfernalWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioInfernalWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioInfernalWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioInfernalWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioInfernalWrapper new.
	wrapper outfile: 'test_output.txt'.
	self assert: wrapper isNotNil
]
