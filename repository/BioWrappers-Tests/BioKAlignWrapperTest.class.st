Class {
	#name : 'BioKAlignWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioKAlignWrapperTest >> testCategory [

	self
		assert: BioKAlignWrapper category
		equals: 'Multiple Sequence Alignment'
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioKAlignWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testFluentInterface [

	| wrapper |
	wrapper := BioKAlignWrapper new
		           seqTypeDNA;
		           yourself.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testFluentParameterSetting [

	| wrapper |
	wrapper := BioKAlignWrapper new.
	wrapper
		seqTypeDNA;
		out: 'output.txt'.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioKAlignWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testParameterConfiguration [

	| wrapper |
	wrapper := BioKAlignWrapper new.
	wrapper seqTypeDNA ifNil: [ nil ] ifNotNil: [ :v | v ].
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioKAlignWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioKAlignWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
