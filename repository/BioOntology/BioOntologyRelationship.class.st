Class {
	#name : 'BioOntologyRelationship',
	#superclass : 'Object',
	#instVars : [
		'subject',
		'predicate',
		'object'
	],
	#category : 'BioOntology-Core',
	#package : 'BioOntology',
	#tag : 'Core'
}

{ #category : 'instance creation' }
BioOntologyRelationship class >> subject: aSubject predicate: aPredicate object: anObject [
	^ self new subject: aSubject; predicate: aPredicate; object: anObject; yourself
]

{ #category : 'comparing' }
BioOntologyRelationship >> = other [
	^ self class = other class and: [ subject = other subject and: [ predicate = other predicate and: [ object = other object ] ] ]

]

{ #category : 'comparing' }
BioOntologyRelationship >> hash [
	^ (subject hash bitXor: predicate hash) bitXor: object hash

]

{ #category : 'testing' }
BioOntologyRelationship >> isA [
	^ predicate = #is_a

]

{ #category : 'testing' }
BioOntologyRelationship >> isHasRole [
	^ predicate = #has_role

]

{ #category : 'testing' }
BioOntologyRelationship >> isNegativelyRegulates [
	^ predicate = #negatively_regulates

]

{ #category : 'testing' }
BioOntologyRelationship >> isPartOf [
	^ predicate = #part_of

]

{ #category : 'testing' }
BioOntologyRelationship >> isPositivelyRegulates [
	^ predicate = #positively_regulates

]

{ #category : 'testing' }
BioOntologyRelationship >> isRegulates [
	^ predicate = #regulates

]

{ #category : 'accessing' }
BioOntologyRelationship >> label [
	^ predicate asString copyReplaceAll: '_' with: ' ' 

]

{ #category : 'accessing' }
BioOntologyRelationship >> object [
	^ object

]

{ #category : 'accessing' }
BioOntologyRelationship >> object: anObject [
	object := anObject

]

{ #category : 'accessing' }
BioOntologyRelationship >> predicate [
	^ predicate

]

{ #category : 'accessing' }
BioOntologyRelationship >> predicate: aSymbol [
	predicate := aSymbol

]

{ #category : 'printing' }
BioOntologyRelationship >> printOn: aStream [
	aStream nextPutAll: predicate asString.
	aStream space.
	subject ifNotNil: [subject id ifNotNil: [aStream nextPutAll: subject id] ifNil: [aStream print: subject]].
	aStream nextPutAll: ' -> '.
	object ifNotNil: [object id ifNotNil: [aStream nextPutAll: object id] ifNil: [aStream print: object]]

]

{ #category : 'accessing' }
BioOntologyRelationship >> subject [
	^ subject

]

{ #category : 'accessing' }
BioOntologyRelationship >> subject: anObject [
	subject := anObject

]
