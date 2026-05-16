Class {
	#name : 'BioBayAreaWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioBayAreaWrapperTest >> testCategory [

	self assert: BioBayAreaWrapper category equals: #'BioWrappers-Popgen'
]

{ #category : 'tests' }
BioBayAreaWrapperTest >> testInheritsFromBioWrapperObject [

	self assert: BioBayAreaWrapper superclass equals: BioWrapperObject
]

{ #category : 'tests' }
BioBayAreaWrapperTest >> testParameters [

	| wrapper |
	wrapper := BioBayAreaWrapper new.
	wrapper
		chainLength: 100000;
		chainBurnIn: 10000.
	self assert: wrapper isNotNil
]
