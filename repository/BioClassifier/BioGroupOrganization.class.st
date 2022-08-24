Class {
	#name : #BioGroupOrganization,
	#superclass : #BioObject,
	#instVars : [
		'contents',
		'selector',
		'strategy',
		'elementGroupClass'
	],
	#category : #'BioClassifier-Core'
}

{ #category : #'instance creation' }
BioGroupOrganization class >> for: comparatorSymbol on: selectorSymbol [

	^ self new 
		selector: selectorSymbol;
		strategy: comparatorSymbol.
]

{ #category : #'instance creation' }
BioGroupOrganization class >> forEqualityOn: aSymbol [

	^ self new 
		selector: aSymbol;
		setEquality.
]

{ #category : #'instance creation' }
BioGroupOrganization class >> forGreaterThanOn: aSymbol [

	^ self new 
		selector: aSymbol;
		setGreaterThan.
]

{ #category : #'instance creation' }
BioGroupOrganization class >> forLessThanOn: aSymbol [

	^ self new 
		selector: aSymbol;
		setLessThan.
]

{ #category : #'instance creation' }
BioGroupOrganization class >> forSimilarityOn: aSymbol [

	^ self new 
		selector: aSymbol;
		setSimilarity.
]

{ #category : #'instance creation' }
BioGroupOrganization class >> withAll: aCollection [
	"Answer a new instance containing all the elements from aCollection."
	
	^ self new initializeWith: aCollection
]

{ #category : #accessing }
BioGroupOrganization >> addOrganization: aBioOrganization [

	self contents add: aBioOrganization

]

{ #category : #converting }
BioGroupOrganization >> asBioGroupOrganization [

	^ self
]

{ #category : #'accessing-output' }
BioGroupOrganization >> classesSize [
	"Answer a <Number> representing how many classes <BioOrganization> the receiver contains "

	^ self contents size
]

{ #category : #'accessing-output' }
BioGroupOrganization >> classificationsSize [
	"Answer a <Number> representing how many classes <BioOrganization> the receiver contains"

	^ self contents sum: #size
]

{ #category : #accessing }
BioGroupOrganization >> collect: aBlockOrSymbol [

	^ self contents collect: aBlockOrSymbol 
]

{ #category : #'accessing-output' }
BioGroupOrganization >> contents [
	"Answer a <Collection> with the contained groups in the receiver"

	^ contents
		ifNil: [ contents := self contentsClass new ]
]

{ #category : #'accessing-output' }
BioGroupOrganization >> contents: anObject [
	contents := anObject
]

{ #category : #'initialize-release' }
BioGroupOrganization >> contentsClass [

	^ OrderedCollection
]

{ #category : #'initialize-release' }
BioGroupOrganization >> defaultElementGroupClass [

	^ BioOrganization
]

{ #category : #accessing }
BioGroupOrganization >> do: aBlockOrSymbol [

	^ self contents do: aBlockOrSymbol 
]

{ #category : #'initialize-release' }
BioGroupOrganization >> elementGroupClass [

	^ elementGroupClass
		ifNil: [ elementGroupClass := self defaultElementGroupClass ]
]

{ #category : #accessing }
BioGroupOrganization >> elementGroupClass: anObject [
	elementGroupClass := anObject
]

{ #category : #'accessing-output' }
BioGroupOrganization >> features [
	"Answer a <Collection> with the receiver's features"
	
	^ self contents collect: #feature
]

{ #category : #accessing }
BioGroupOrganization >> groupFor: anObject [

	| attValue |
	attValue := anObject perform: self selector.
	^ self strategy = #=
		ifTrue: [ self contents 
				detect: [: cluster | cluster feature perform: self strategy with: attValue ]
				ifNone: [ nil ] ]
		ifFalse: [ self contents detectMax: [: org | org feature perform: self strategy with: attValue ] ].


]

{ #category : #accessing }
BioGroupOrganization >> groupFor: anObject feature: featureName [

	| attValue |
	attValue := anObject perform: self selector.
	^ self strategy = #=
		ifTrue: [ self contents 
				detect: [: cluster | (cluster perform: featureName) perform: self strategy with: attValue ]
				ifNone: [ nil ] ]
		ifFalse: [ self contents detectMax: [: org | (org perform: featureName) perform: self strategy with: attValue ] ].


]

{ #category : #testing }
BioGroupOrganization >> includes: anObject [
	"Answer <true> whether anObject is one of the receiver's elements."
	
	^ self contents includes: anObject
]

{ #category : #accessing }
BioGroupOrganization >> indexOf: object [

	^ self contents indexOf: object
]

{ #category : #'initialize-release' }
BioGroupOrganization >> initializeWith: aCollection [
	" Private - Set the receiver's groups using aCollection "
	
	contents := aCollection collect: [: elem | self elementGroupClass new name: elem ]
]

{ #category : #'accessing-output' }
BioGroupOrganization >> maxClass [
	" Answer the BioOrganization class with most assignments in the receiver's classifier "
	
	^ self contents detectMax: [: each | each classifications size ]
]

{ #category : #'accessing-output' }
BioGroupOrganization >> maxClasses [
	" Answer how many classes could be assigned in the receiver with the maximum number of features "
	
	^ self maxClass size
]

{ #category : #'accessing-output' }
BioGroupOrganization >> minClass [
	" Answer the BioOrganization class with the fewer assignments in the receiver's classifier "

	^ self contents detectMin: [: each | each classifications size ]
]

{ #category : #'accessing-output' }
BioGroupOrganization >> minClasses [
	" Answer how many classes has been assigned in the receiver with the minimum number of features "
	
	^ self minClass size
]

{ #category : #printing }
BioGroupOrganization >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream
		space;
		nextPut: $#;
		nextPutAll: self selector asString;
		space;
		nextPutAll: self strategy asString;
		cr.
	self contents printOn: aStream.
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> selector [
	^ selector
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> selector: anObject [
	selector := anObject
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> setEquality [

	strategy := #=
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> setGreaterThan [

	strategy := #>
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> setLessThan [

	strategy := #<=
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> setSimilarity [

	strategy := #alike:
]

{ #category : #accessing }
BioGroupOrganization >> size [
	"Answer how many elements the receiver contains."

	^ self contents size
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> strategy [
	^ strategy
]

{ #category : #'accessing-strategy' }
BioGroupOrganization >> strategy: anObject [
	strategy := anObject
]
