Class {
	#name : 'BioEMBOSSDotmatcherWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testCategory [

	self
		assert: BioEMBOSSDotmatcherWrapper category
		equals: 'Sequence Statistics'
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testDefaultProgramName [

	| wrapper |
	wrapper := BioEMBOSSDotmatcherWrapper new.
	self assert: wrapper defaultProgramName isString
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testFluentInterface [

	| wrapper |
	wrapper := BioEMBOSSDotmatcherWrapper new
		           matrixBlosum62;
		           yourself.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testFluentParameterSetting [

	| wrapper |
	wrapper := BioEMBOSSDotmatcherWrapper new.
	wrapper
		seqTypeDNA;
		out: 'output.txt'.
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioEMBOSSDotmatcherWrapper superclass
		equals: BioWrapperObject
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testParameterConfiguration [

	| wrapper |
	wrapper := BioEMBOSSDotmatcherWrapper new.
	wrapper matrixBlosum62 ifNil: [ nil ] ifNotNil: [ :v | v ].
	self assert: wrapper isNotNil
]

{ #category : 'tests' }
BioEMBOSSDotmatcherWrapperTest >> testParameterSetter [

	| wrapper |
	wrapper := BioEMBOSSDotmatcherWrapper new.
	wrapper out: 'test_output.txt'.
	self assert: wrapper isNotNil
]
