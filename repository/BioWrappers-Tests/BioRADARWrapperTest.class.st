Class {
	#name : 'BioRADARWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioRADARWrapperTest >> testCategory [

	self
		assert: BioRADARWrapper category
		equals: 'Protein Functional Analysis'
]

{ #category : 'tests' }
BioRADARWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioRADARWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioRADARWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioRADARWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioRADARWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioRADARWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
