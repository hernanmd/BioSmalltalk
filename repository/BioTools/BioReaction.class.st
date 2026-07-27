"
I represent a biochemical reaction with reactants and products (each with stoichiometry), optional catalysts/enzymes, reversibility, kinetic law and parameters, gene association rules (GPR), flux bounds, and ontology terms. I generalize Biopython Reaction, libSBML Reaction and BioPAX BiochemicalReaction.
"
Class {
	#name : 'BioReaction',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'reactants',
		'products',
		'catalysts',
		'enzymes',
		'reversible',
		'kineticLaw',
		'parameters',
		'geneAssociation',
		'lowerBound',
		'upperBound',
		'ontologyTerms',
		'data',
		'catalyses',
		'substrates'
	],
	#package : 'BioTools'
}

{ #category : 'instance creation' }
BioReaction class >> id: anId name: aName [
	^ self new id: anId; name: aName; yourself
]

{ #category : 'comparing' }
BioReaction >> = other [
	^ self class = other class and: [ id = other id ]
]

{ #category : 'accessing' }
BioReaction >> addCatalysis: aBioCatalysis [

	(self catalyses includes: aBioCatalysis) ifTrue: [ ^ self ].
	self catalyses add: aBioCatalysis.
	aBioCatalysis reaction == self ifFalse: [
		aBioCatalysis reaction: self ]
]

{ #category : 'adding' }
BioReaction >> addCatalyst: aSpecies [
	self catalysts add: aSpecies
]

{ #category : 'adding' }
BioReaction >> addEnzyme: aSpecies [
	self enzymes add: aSpecies
]

{ #category : 'adding' }
BioReaction >> addOntologyTerm: aTerm [
	self ontologyTerms add: aTerm
]

{ #category : 'accessing' }
BioReaction >> addProduct: aSpecies [
	self addProduct: aSpecies stoichiometry: 1
]

{ #category : 'adding' }
BioReaction >> addProduct: aSpecies stoichiometry: aNumber [
	self products add: aSpecies -> aNumber
]

{ #category : 'adding' }
BioReaction >> addReactant: aSpecies [
	self addReactant: aSpecies stoichiometry: 1
]

{ #category : 'adding' }
BioReaction >> addReactant: aSpecies stoichiometry: aNumber [
	self reactants add: aSpecies -> aNumber
]

{ #category : 'accessing' }
BioReaction >> addSubstrate: aBioSequence [

	self substrates add: aBioSequence
]

{ #category : 'accessing' }
BioReaction >> allSpecies [
	| all |
	all := OrderedCollection new.
	self reactants do: [ :assoc | all add: assoc key ].
	self products do: [ :assoc | all add: assoc key ].
	^ all
]

{ #category : 'accessing' }
BioReaction >> catalyses [
 
	^ catalyses ifNil: [ catalyses := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> catalyses: anObject [

	catalyses := anObject
]

{ #category : 'accessing' }
BioReaction >> catalysts [
	^ catalysts ifNil: [ catalysts := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> data [
	^ data ifNil: [ data := Dictionary new ]
]

{ #category : 'accessing' }
BioReaction >> dataAt: aKey [
	^ self data at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioReaction >> dataAt: aKey put: aValue [
	^ self data at: aKey put: aValue
]

{ #category : 'accessing' }
BioReaction >> enzymes [
	^ enzymes ifNil: [ enzymes := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> geneAssociation [
	^ geneAssociation
]

{ #category : 'accessing' }
BioReaction >> geneAssociation: aString [
	geneAssociation := aString
]

{ #category : 'comparing' }
BioReaction >> hash [
	^ id ifNil: [ super hash ]
]

{ #category : 'accessing' }
BioReaction >> id [
	^ id
]

{ #category : 'accessing' }
BioReaction >> id: anObject [
	id := anObject
]

{ #category : 'testing' }
BioReaction >> isReversible [
	^ self reversible
]

{ #category : 'accessing' }
BioReaction >> kineticLaw [
	^ kineticLaw
]

{ #category : 'accessing' }
BioReaction >> kineticLaw: aString [
	kineticLaw := aString
]

{ #category : 'accessing' }
BioReaction >> leftSide [
	^ self reactants
]

{ #category : 'accessing' }
BioReaction >> lowerBound [
	^ lowerBound ifNil: [ lowerBound := 0.0 ]
]

{ #category : 'accessing' }
BioReaction >> lowerBound: aNumber [
	lowerBound := aNumber
]

{ #category : 'accessing' }
BioReaction >> name [
	^ name
]

{ #category : 'accessing' }
BioReaction >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
BioReaction >> ontologyTerms [
	^ ontologyTerms ifNil: [ ontologyTerms := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> parameterAt: aKey [
	^ self parameters at: aKey ifAbsent: [ nil ]
]

{ #category : 'accessing' }
BioReaction >> parameterAt: aKey put: aValue [
	^ self parameters at: aKey put: aValue
]

{ #category : 'accessing' }
BioReaction >> parameters [
	^ parameters ifNil: [ parameters := Dictionary new ]
]

{ #category : 'printing' }
BioReaction >> printOn: aStream [ super printOn: aStream. aStream nextPutAll: ' ('. name ifNotNil: [ aStream nextPutAll: name ]. aStream nextPutAll: ')'
]

{ #category : 'accessing' }
BioReaction >> products [
	^ products ifNil: [ products := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> products: anObject [

	products := anObject
]

{ #category : 'accessing' }
BioReaction >> reactants [
	^ reactants ifNil: [ reactants := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> reversible [
	^ reversible ifNil: [ reversible := false ]
]

{ #category : 'accessing' }
BioReaction >> reversible: aBoolean [
	reversible := aBoolean
]

{ #category : 'accessing' }
BioReaction >> rightSide [
	^ self products
]

{ #category : 'accessing' }
BioReaction >> substrates [

	^ substrates 
		ifNil: [ substrates := OrderedCollection new ]
]

{ #category : 'accessing' }
BioReaction >> substrates: anObject [

	substrates := anObject
]

{ #category : 'accessing' }
BioReaction >> upperBound [
	^ upperBound ifNil: [ upperBound := Float infinity ]
]

{ #category : 'accessing' }
BioReaction >> upperBound: aNumber [
	upperBound := aNumber
]
