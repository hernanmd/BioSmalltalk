Class {
	#name : 'BioComplex',
	#superclass : 'BioPathwaySpecies',
	#instVars : [
		'subunits'
	],
	#category : 'BioPathway',
	#package : 'BioPathway'
}

{ #category : 'adding' }
BioComplex >> addSubunit: aSpecies [
	self subunits add: aSpecies
]

{ #category : 'adding' }
BioComplex >> addSubunit: aSpecies stoichiometry: anInteger [
	self subunits add: aSpecies -> anInteger
]

{ #category : 'testing' }
BioComplex >> isComplex [
	^ true
]

{ #category : 'accessing' }
BioComplex >> subunits [
	^ subunits ifNil: [ subunits := OrderedCollection new ]
]
