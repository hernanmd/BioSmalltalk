Class {
	#name : 'BioSimplePhylogenyWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioSimplePhylogenyWrapperTest >> testCategory [

	self assert: BioSimplePhylogenyWrapper category equals: 'Phylogeny'
]

{ #category : 'tests' }
BioSimplePhylogenyWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioSimplePhylogenyWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioSimplePhylogenyWrapperTest >> testFluentParameterSetting [

	| wrapper |
	wrapper := BioSimplePhylogenyWrapper new.
	wrapper clusteringMethodNJ.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioSimplePhylogenyWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioSimplePhylogenyWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioSimplePhylogenyWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioSimplePhylogenyWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
