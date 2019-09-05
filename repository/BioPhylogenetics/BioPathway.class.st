"
Implements Binary relations and Graph algorithms based in the BioRuby Pathway.rb library
"
Class {
	#name : #BioPathway,
	#superclass : #BioNamedObject,
	#instVars : [
		'relations',
		'graph',
		'undirected',
		'index'
	],
	#category : 'BioPhylogenetics-Core'
}

{ #category : #examples }
BioPathway class >> example01 [

	^ BioPathway newUndirected
		list: (Array 
			with: (BioRelation node: 'a' edge: 1 node: 'b')
			with: (BioRelation node: 'a' edge: 5 node: 'c')
			with: (BioRelation node: 'b' edge: 3 node: 'c')
			);
		yourself
]

{ #category : #'instance creation' }
BioPathway class >> newUndirected [
	" Answer a new undirected graph "

	^ self new
		beUndirected;
		yourself
]

{ #category : #accessing }
BioPathway >> addRelation: aBioRelation changed: aBoolean [
	" Add aBioRelation to the receiver's graph and relations. If aBoolean is <false> then relations is not modified "

	aBoolean
		ifTrue: [ self relations add: aBioRelation ].
	(self graph at: aBioRelation from)
		ifNil: [ self graph 
							at: aBioRelation from 
							put: Dictionary new ].
	(self graph at: aBioRelation to)
		ifNil: [ self graph 
							at: aBioRelation to 
							put: Dictionary new ].
	(self graph at: aBioRelation from) 
		at: aBioRelation to 
		put: aBioRelation relation.
	self isUndirected 
		ifTrue: [ 
			(self graph at: aBioRelation to)
				at: aBioRelation from
				put: aBioRelation relation ]

]

{ #category : #accessing }
BioPathway >> beDirected [
	" Set the receiver to be an directed graph, and re-generate the adjacency list. "

	self isUndirected
		ifTrue: [ ^ self ].
	undirected := false.
	self buildAdjList
]

{ #category : #accessing }
BioPathway >> beUndirected [
	" Set the receiver to be an undirected graph, and re-generate the adjacency list. The undirected graph can be converted to directed graph, however, the edge between two nodes will be simply doubled to both ends "

	self isDirected
		ifTrue: [ ^ self ].
	undirected := true.
	self buildAdjList
]

{ #category : #private }
BioPathway >> buildAdjList [
	" Private - Build an adjacency list from the receiver's relations "
	
	self clearGraph.
	self relations do: [ : rel | self addRelation: rel changed: false ]
]

{ #category : #private }
BioPathway >> buildRelationsList [
	" Private - Build the relations from the adjacency list graph "
	
	self clearRelations.
	self graph do: [  ]
]

{ #category : #accessing }
BioPathway >> clearGraph [

	graph := nil
]

{ #category : #accessing }
BioPathway >> clearRelations [
	" Clear the relations to reduce memory usage "
	
	self relations: nil
]

{ #category : #accessing }
BioPathway >> delete: aBioRelation [
	" Remove an edge indicated by aBioRelation from the receiver's graph and relations "
	
	self shouldBeImplemented
]

{ #category : #accessing }
BioPathway >> edges [
	" Answer the number of edges in the receiver's graph "
	
	^ self graph
		inject: 0
		into: [ : sum : edge | sum + edge size ]
]

{ #category : #accessing }
BioPathway >> graph [
	^ graph
]

{ #category : #accessing }
BioPathway >> graph: anObject [
	graph := anObject
]

{ #category : #accessing }
BioPathway >> index [
	^ index
]

{ #category : #accessing }
BioPathway >> index: anObject [
	index := anObject
]

{ #category : #initialize }
BioPathway >> initializeRelation: aCollection [
	" Private - Initialize the receiver's using aCollection of <BioRelation> "
	
	self relations: aCollection.
	self graph: Dictionary new.
	self index: Dictionary new.
	undirected := false.
	self buildAdjList.
]

{ #category : #testing }
BioPathway >> isDirected [
	" Answer <true> if receiver is a directed graph "

	^ undirected not
]

{ #category : #testing }
BioPathway >> isUndirected [
	" Answer <true> if receiver is a directed graph "

	^ undirected
]

{ #category : #accessing }
BioPathway >> nodes [
	" Answer the number of nodes in the receiver's graph "
	
	^ self graph keys size
]

{ #category : #accessing }
BioPathway >> relations [
	^ relations
]

{ #category : #accessing }
BioPathway >> relations: anObject [
	relations := anObject
]
