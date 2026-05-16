Class {
	#name : 'BioPrattWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPrattWrapperTest >> testCategory [

	self
		assert: BioPrattWrapper category
		equals: 'Protein Functional Analysis'
]

{ #category : 'tests' }
BioPrattWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioPrattWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioPrattWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioPrattWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioPrattWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioPrattWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
