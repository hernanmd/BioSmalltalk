Class {
	#name : 'BioTCoffeeWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioTCoffeeWrapperTest >> testCategory [

	self
		assert: BioTCoffeeWrapper category
		equals: 'Multiple Sequence Alignment'
]

{ #category : 'tests' }
BioTCoffeeWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioTCoffeeWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioTCoffeeWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioTCoffeeWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioTCoffeeWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioTCoffeeWrapper new.
	wrapper outfile: 'test_output.txt'.
	self assert: wrapper isNotNil
]
