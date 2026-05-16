Class {
	#name : 'BioPritchardStructureWrapperTest',
	#superclass : 'TestCase',
	#category : 'BioWrappers-Tests-Core',
	#package : 'BioWrappers-Tests',
	#tag : 'Core'
}

{ #category : 'tests' }
BioPritchardStructureWrapperTest >> testCategory [

	self
		assert: BioPritchardStructureWrapper category
		equals: #'BioWrappers-Programs'
]

{ #category : 'tests' }
BioPritchardStructureWrapperTest >> testInheritsFromBioWrapperObject [

	self
		assert: BioPritchardStructureWrapper superclass
		equals: BioWrapperObject
]
