Class {
	#name : 'BioEMBOSSPepstatsWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSPepstatsWrapperTest >> testCategory [

	self
		assert: BioEMBOSSPepstatsWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSPepstatsWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSPepstatsWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSPepstatsWrapperTest >> testFluentParameterSetting [

	| wrapper |
	wrapper := BioEMBOSSPepstatsWrapper new.
	wrapper includeTerminiCharges.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioEMBOSSPepstatsWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSPepstatsWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSPepstatsWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSPepstatsWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
