"
I represent a term from a bioinformatics ontology (e.g. SBO, GO, ChEBI, KEGG). I have an id, name, definition, the ontology I belong to, and an optional source URL. I support equality by id + ontology.
"
Class {
	#name : 'BioOntologyTerm',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'definition',
		'ontology',
		'source',
		'namespace',
		'synonyms',
		'crossReferences',
		'isObsolete',
		'consider',
		'replacementOf',
		'data',
		'parents',
		'children'
	],
	#category : 'BioOntology-Core',
	#package : 'BioOntology',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioOntologyTerm class >> chebi: anId [
 ^ self id: anId name: '' ontology: 'ChEBI'

]

{ #category : 'as yet unclassified' }
BioOntologyTerm class >> fromId: anId [ ^ self new id: anId; yourself
]

{ #category : 'instance creation' }
BioOntologyTerm class >> go: anId [
 ^ self id: anId name: '' ontology: 'GO'

]

{ #category : 'instance creation' }
BioOntologyTerm class >> id: anId name: aName ontology: anOntology [
	^ self new id: anId; name: aName; ontology: anOntology; yourself
]

{ #category : 'instance creation' }
BioOntologyTerm class >> id: anId name: aName ontology: anOntology namespace: aNamespace [
	^ self new id: anId; name: aName; ontology: anOntology; namespace: aNamespace; yourself
]

{ #category : 'instance creation' }
BioOntologyTerm class >> sbo: anId [
 ^ self id: anId name: '' ontology: 'SBO'

]

{ #category : 'comparing' }
BioOntologyTerm >> = other [

	^ self class = other class and: [
		  id = other id and: [ ontology = other ontology ] ]
]

{ #category : 'adding' }
BioOntologyTerm >> addChild: aRelationship [
	children add: aRelationship

]

{ #category : 'adding' }
BioOntologyTerm >> addConsider: aTermId [
	consider add: aTermId

]

{ #category : 'adding' }
BioOntologyTerm >> addCrossReference: aString [
	crossReferences add: aString

]

{ #category : 'adding' }
BioOntologyTerm >> addParent: aRelationship [
	parents add: aRelationship

]

{ #category : 'adding' }
BioOntologyTerm >> addRelationship: aType to: targetTerm [
	| rel |
	rel := BioOntologyRelationship subject: self predicate: aType object: targetTerm.
	self addParent: (BioOntologyRelationship subject: self predicate: aType object: targetTerm).
	targetTerm addChild: (BioOntologyRelationship subject: self predicate: aType object: targetTerm).
	^ rel

]

{ #category : 'adding' }
BioOntologyTerm >> addSynonym: aString type: aType [
	(synonyms at: aType ifAbsentPut: [OrderedCollection new]) add: aString

]

{ #category : 'accessing' }
BioOntologyTerm >> allChildren [
	| visited stack |
	visited := Set new.
	stack := children copy.
	[stack isEmpty] whileFalse: [
		| rel |
		rel := stack removeFirst.
		(visited includes: rel subject) ifFalse: [
			visited add: rel subject.
			stack addAll: rel subject children ] ].
	^ visited

]

{ #category : 'accessing' }
BioOntologyTerm >> allParents [
	| visited stack |
	visited := Set new.
	stack := parents copy.
	[stack isEmpty] whileFalse: [
		| rel |
		rel := stack removeFirst.
		(visited includes: rel object) ifFalse: [
			visited add: rel object.
			stack addAll: rel object parents ] ].
	^ visited

]

{ #category : 'accessing - synonyms' }
BioOntologyTerm >> broadSynonyms [

	^ self synonymsOfType: #broad
]

{ #category : 'accessing' }
BioOntologyTerm >> children [
	^ children

]

{ #category : 'accessing' }
BioOntologyTerm >> consider [
	^ consider

]

{ #category : 'accessing' }
BioOntologyTerm >> crossReferences [
	^ crossReferences

]

{ #category : 'accessing' }
BioOntologyTerm >> data [
	^ data

]

{ #category : 'accessing' }
BioOntologyTerm >> dataAt: aKey [
	^ data at: aKey ifAbsent: [nil]

]

{ #category : 'accessing' }
BioOntologyTerm >> dataAt: aKey put: aValue [
	^ data at: aKey put: aValue

]

{ #category : 'accessing' }
BioOntologyTerm >> definition [
	^ definition
]

{ #category : 'accessing' }
BioOntologyTerm >> definition: anObject [
	definition := anObject
]

{ #category : 'accessing - relationships' }
BioOntologyTerm >> depthToRoot [
	| depth visited queue |
	parents isEmpty ifTrue: [ ^ 0 ].
	depth := 0.
	visited := Set with: self.
	queue := OrderedCollection withAll: (parents collect: [:r | r object]).
	[queue isEmpty] whileFalse: [
		| nextQueue |
		depth := depth + 1.
		nextQueue := OrderedCollection new.
		queue do: [:term |
			(visited includes: term) ifFalse: [
				visited add: term.
				term parents isEmpty ifTrue: [ ^ depth ].
				nextQueue addAll: (term parents collect: [:r | r object]) ] ].
		queue := nextQueue ].
	^ depth

]

{ #category : 'accessing - synonyms' }
BioOntologyTerm >> exactSynonyms [

	^ self synonymsOfType: #exact
]

{ #category : 'testing' }
BioOntologyTerm >> hasRole: aTargetTerm [
	^ self addRelationship: #has_role to: aTargetTerm

]

{ #category : 'comparing' }
BioOntologyTerm >> hash [
	^ (id ifNil: [ 0 ]) hash bitXor: (ontology ifNil: [ 0 ]) hash
]

{ #category : 'accessing' }
BioOntologyTerm >> id [
	^ id
]

{ #category : 'accessing' }
BioOntologyTerm >> id: anObject [
	id := anObject
]

{ #category : 'initialization' }
BioOntologyTerm >> initialize [
	super initialize.
	synonyms := Dictionary new.
	crossReferences := OrderedCollection new.
	isObsolete := false.
	consider := OrderedCollection new.
	data := Dictionary new.
	parents := OrderedCollection new.
	children := OrderedCollection new

]

{ #category : 'testing' }
BioOntologyTerm >> isA: aParentTerm [
	^ self addRelationship: #is_a to: aParentTerm

]

{ #category : 'testing' }
BioOntologyTerm >> isChEBI [
	^ ontology = 'ChEBI'
]

{ #category : 'testing' }
BioOntologyTerm >> isGO [
	^ ontology = 'GO'
]

{ #category : 'accessing' }
BioOntologyTerm >> isObsolete [
	^ isObsolete

]

{ #category : 'accessing' }
BioOntologyTerm >> isObsolete: aBoolean [
	isObsolete := aBoolean

]

{ #category : 'testing' }
BioOntologyTerm >> isReplacedBy [
	^ replacementOf

]

{ #category : 'testing' }
BioOntologyTerm >> isReplacedBy: aTermId [
	replacementOf := aTermId

]

{ #category : 'testing' }
BioOntologyTerm >> isSBO [
	^ ontology = 'SBO'
]

{ #category : 'accessing' }
BioOntologyTerm >> name [
	^ name
]

{ #category : 'accessing' }
BioOntologyTerm >> name: anObject [
	name := anObject
]

{ #category : 'accessing' }
BioOntologyTerm >> namespace [
	^ namespace

]

{ #category : 'accessing' }
BioOntologyTerm >> namespace: aString [
	namespace := aString

]

{ #category : 'accessing - synonyms' }
BioOntologyTerm >> narrowSynonyms [

	^ self synonymsOfType: #narrow
]

{ #category : 'accessing - relationships' }
BioOntologyTerm >> negativelyRegulates: aTargetTerm [

	^ self addRelationship: #negatively_regulates to: aTargetTerm
]

{ #category : 'accessing' }
BioOntologyTerm >> ontology [
	^ ontology
]

{ #category : 'accessing' }
BioOntologyTerm >> ontology: anObject [
	ontology := anObject
]

{ #category : 'accessing' }
BioOntologyTerm >> parents [
	^ parents

]

{ #category : 'accessing' }
BioOntologyTerm >> parents: aCollection [
	parents := aCollection

]

{ #category : 'accessing - relationships' }
BioOntologyTerm >> partOf: aParentTerm [
	^ self addRelationship: #part_of to: aParentTerm

]

{ #category : 'accessing - relationships' }
BioOntologyTerm >> positivelyRegulates: aTargetTerm [
	^ self addRelationship: #positively_regulates to: aTargetTerm

]

{ #category : 'printing' }
BioOntologyTerm >> printOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPut: $(.
	id ifNotNil: [ aStream nextPutAll: id ].
	ontology ifNotNil: [ aStream space. aStream nextPutAll: ontology ].
	aStream nextPut: $)

]

{ #category : 'accessing - relationships' }
BioOntologyTerm >> regulates: aTargetTerm [
	^ self addRelationship: #regulates to: aTargetTerm

]

{ #category : 'accessing - synonyms' }
BioOntologyTerm >> relatedSynonyms [

	^ self synonymsOfType: #related
]

{ #category : 'accessing' }
BioOntologyTerm >> source [
	^ source
]

{ #category : 'accessing' }
BioOntologyTerm >> source: anObject [
	source := anObject
]

{ #category : 'accessing' }
BioOntologyTerm >> synonyms [
	^ synonyms

]

{ #category : 'accessing - synonyms' }
BioOntologyTerm >> synonymsOfType: aType [

	^ synonyms at: aType ifAbsent: [ #(  ) ]
]
