Class {
	#name : 'BioOntology',
	#superclass : 'Object',
	#instVars : [
		'id',
		'name',
		'version',
		'lastUpdated',
		'terms',
		'relationships',
		'namespaces',
		'metadata',
		'data'
	],
	#category : 'BioOntology-Core',
	#package : 'BioOntology',
	#tag : 'Core'
}

{ #category : 'as yet unclassified' }
BioOntology class >> fromChEBI [
	| onto |
	onto := self id: 'ChEBI' name: 'Chemical Entities of Biological Interest'.
	onto metadataAt: 'source' put: 'https://ftp.ebi.ac.uk/pub/databases/chebi/ontology/chebi.obo'.
	^ onto

]

{ #category : 'as yet unclassified' }
BioOntology class >> fromGO [
	| onto |
	onto := self id: 'GO' name: 'Gene Ontology'.
	onto metadataAt: 'source' put: 'http://purl.obolibrary.org/obo/go.obo'.
	^ onto

]

{ #category : 'as yet unclassified' }
BioOntology class >> fromSBO [
	| onto |
	onto := self id: 'SBO' name: 'Systems Biology Ontology'.
	onto metadataAt: 'source' put: 'https://raw.githubusercontent.com/EBI-BioModels/SBO/main/SBO_Ontology.obo'.
	^ onto

]

{ #category : 'instance creation' }
BioOntology class >> id: anId name: aName [
	^ self new id: anId; name: aName; yourself
]

{ #category : 'as yet unclassified' }
BioOntology class >> loadFromOBO: aString [
	^ BioOBOOntologyParser new parse: aString

]

{ #category : 'accessing - terms' }
BioOntology >> activeTerms [
	^ terms values reject: [:t | t isObsolete]

]

{ #category : 'adding' }
BioOntology >> addNamespace: aBioOntologyNamespace [
	namespaces at: aBioOntologyNamespace id put: aBioOntologyNamespace

]

{ #category : 'adding' }
BioOntology >> addRelationship: aBioOntologyRelationship [
	relationships add: aBioOntologyRelationship

]

{ #category : 'adding' }
BioOntology >> addTerm: aBioOntologyTerm [

	terms at: aBioOntologyTerm id put: aBioOntologyTerm.
	aBioOntologyTerm namespace ifNotNil: [
			namespaces at: aBioOntologyTerm namespace ifAbsentPut: [
					BioOntologyNamespace
						id: aBioOntologyTerm namespace
						name: aBioOntologyTerm namespace ] ].
	^ aBioOntologyTerm
]

{ #category : 'accessing - relationships' }
BioOntology >> ancestorsOf: aTerm [
	^ aTerm allParents

]

{ #category : 'accessing - terms' }
BioOntology >> annotate: aBioObject withTerm: aTerm qualifier: aQualifier [
	| annotation |
	annotation := BioAnnotation entity: aBioObject term: aTerm.
	aQualifier ifNotNil: [annotation qualifier: aQualifier].
	aBioObject addOntologyTerm: aTerm.
	^ annotation

]

{ #category : 'converting' }
BioOntology >> asGraph [
	| net |
	net := BioNetwork new.
	terms values do: [:t |
		net addNode: t.
		t parents do: [:rel | net addEdge: (BioInteraction source: t target: rel object type: rel predicate)] ].
	^ net

]

{ #category : 'accessing - relationships' }
BioOntology >> commonAncestorsOf: term1 and: term2 [
	^ term1 allParents intersection: term2 allParents

]

{ #category : 'accessing' }
BioOntology >> data [
	^ data

]

{ #category : 'accessing' }
BioOntology >> dataAt: aKey [
	^ data at: aKey ifAbsent: [nil]

]

{ #category : 'accessing' }
BioOntology >> dataAt: aKey put: aValue [
	^ data at: aKey put: aValue

]

{ #category : 'accessing - relationships' }
BioOntology >> descendantsOf: aTerm [
	^ aTerm allChildren

]

{ #category : 'exporting' }
BioOntology >> exportToOBO [
	| stream |
	stream := (String new: 10000) writeStream.
	metadata keysAndValuesDo: [:k :v | stream nextPutAll: k; nextPut: $:; space; nextPutAll: v; cr].
	stream cr.
	terms values do: [:t |
		stream nextPutAll: '[Term]'; cr.
		t id ifNotNil: [stream nextPutAll: 'id: '; nextPutAll: t id; cr].
		t name ifNotNil: [stream nextPutAll: 'name: '; nextPutAll: t name; cr].
		t namespace ifNotNil: [stream nextPutAll: 'namespace: '; nextPutAll: t namespace; cr].
		t definition ifNotNil: [stream nextPutAll: 'def: "'; nextPutAll: t definition; nextPutAll: '"'; cr].
		t parents do: [:rel |
			rel predicate = #is_a
				ifTrue: [stream nextPutAll: 'is_a: '; nextPutAll: rel object id; cr]
				ifFalse: [stream nextPutAll: 'relationship: '; nextPutAll: rel predicate asString; space; nextPutAll: rel object id; cr]].
		t isObsolete ifTrue: [stream nextPutAll: 'is_obsolete: true'; cr].
		stream cr ].
	^ stream contents

]

{ #category : 'accessing' }
BioOntology >> id [
	^ id

]

{ #category : 'accessing' }
BioOntology >> id: aString [
	id := aString

]

{ #category : 'initialization' }
BioOntology >> initialize [
	super initialize.
	terms := Dictionary new.
	relationships := OrderedCollection new.
	namespaces := Dictionary new.
	metadata := Dictionary new.
	data := Dictionary new

]

{ #category : 'testing' }
BioOntology >> isA: childTerm parent: parentTerm [
	^ childTerm allParents includes: parentTerm

]

{ #category : 'testing' }
BioOntology >> isConnected: term1 to: term2 [
	^ (self commonAncestorsOf: term1 and: term2) notEmpty

]

{ #category : 'accessing' }
BioOntology >> lastUpdated [
	^ lastUpdated

]

{ #category : 'accessing' }
BioOntology >> lastUpdated: aDate [
	lastUpdated := aDate

]

{ #category : 'accessing' }
BioOntology >> metadata [
	^ metadata

]

{ #category : 'accessing' }
BioOntology >> metadataAt: aKey [
	^ metadata at: aKey ifAbsent: [nil]

]

{ #category : 'accessing' }
BioOntology >> metadataAt: aKey put: aValue [
	metadata at: aKey put: aValue

]

{ #category : 'accessing - relationships' }
BioOntology >> mostRecentCommonAncestorOf: term1 and: term2 [
	| commons best bestDepth |
	commons := self commonAncestorsOf: term1 and: term2.
	commons isEmpty ifTrue: [ ^ nil ].
	best := nil.
	bestDepth := -1.
	commons do: [:t | | d |
		d := t depthToRoot.
		d > bestDepth ifTrue: [ bestDepth := d. best := t ] ].
	^ best

]

{ #category : 'accessing' }
BioOntology >> name [
	^ name

]

{ #category : 'accessing' }
BioOntology >> name: aString [
	name := aString

]

{ #category : 'accessing' }
BioOntology >> namespaceAt: anId [
	^ namespaces at: anId ifAbsent: [nil]

]

{ #category : 'accessing' }
BioOntology >> namespaces [
	^ namespaces values

]

{ #category : 'accessing - terms' }
BioOntology >> obsoleteTerms [
	^ terms values select: [:t | t isObsolete]

]

{ #category : 'accessing - relationships' }
BioOntology >> pathsFrom: current accum: path into: allPaths [
	current parents isEmpty
		ifTrue: [ allPaths add: path copy ]
		ifFalse: [ current parents do: [:rel |
			| parent |
			parent := rel object.
			(path includes: parent) ifFalse: [
				path add: parent.
				self pathsFrom: parent accum: path into: allPaths.
				path removeLast ] ] ]

]

{ #category : 'accessing - relationships' }
BioOntology >> pathsToRoot: aTerm [
	| allPaths |
	allPaths := OrderedCollection new.
	self pathsFrom: aTerm accum: (OrderedCollection with: aTerm) into: allPaths.
	^ allPaths

]

{ #category : 'printing' }
BioOntology >> printOn: aStream [
	aStream nextPutAll: self class name.
	aStream nextPut: $(.
	id ifNotNil: [aStream nextPutAll: id].
	name ifNotNil: [aStream space; nextPutAll: name].
	aStream nextPut: $)

]

{ #category : 'accessing' }
BioOntology >> relationships [
	^ relationships

]

{ #category : 'removing' }
BioOntology >> removeTerm: aBioOntologyTerm [
	terms removeKey: aBioOntologyTerm id ifAbsent: [nil]

]

{ #category : 'accessing - terms' }
BioOntology >> termById: anId [
	^ terms at: anId ifAbsent: [nil]

]

{ #category : 'accessing - terms' }
BioOntology >> termCount [
	^ terms size

]

{ #category : 'accessing' }
BioOntology >> terms [
	^ terms values

]

{ #category : 'accessing - terms' }
BioOntology >> termsInNamespace: aNamespaceId [
	^ terms values select: [:t | t namespace = aNamespaceId]

]

{ #category : 'accessing - terms' }
BioOntology >> termsInSubset: aSubsetName [
	^ terms values select: [:t | (t dataAt: 'subset') = aSubsetName]

]

{ #category : 'accessing - terms' }
BioOntology >> termsMatching: aString [
	| lower |
	lower := aString asLowercase.
	^ terms values select: [:t |
		(t name notNil and: [t name asLowercase includesSubstring: lower]) or: [
		t definition notNil and: [t definition asLowercase includesSubstring: lower]]]

]

{ #category : 'accessing - terms' }
BioOntology >> termsWithPrefix: aPrefix [
	^ terms values select: [:t | t id beginsWith: aPrefix]

]

{ #category : 'validation' }
BioOntology >> validateConsistency [
	| warnings |
	warnings := OrderedCollection new.
	terms values do: [:t |
		t isObsolete ifFalse: [
			t parents do: [:rel |
				rel object class = BioOntologyTerm ifTrue: [
					(self termById: rel object id) ifNil: [
						warnings add: t id , ' references missing parent: ' , rel object id ] ] ] ] ].
	^ warnings

]

{ #category : 'accessing' }
BioOntology >> version [
	^ version

]

{ #category : 'accessing' }
BioOntology >> version: aString [
	version := aString

]
