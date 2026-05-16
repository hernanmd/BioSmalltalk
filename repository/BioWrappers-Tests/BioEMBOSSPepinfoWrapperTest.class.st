Class {
	#name : 'BioEMBOSSPepinfoWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSPepinfoWrapperTest >> testCategory [

	self
		assert: BioEMBOSSPepinfoWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSPepinfoWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSPepinfoWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSPepinfoWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSPepinfoWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSPepinfoWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSPepinfoWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
