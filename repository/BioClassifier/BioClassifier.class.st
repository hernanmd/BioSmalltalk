"
A BioClassifier is a generic classifier for Bioinformatics projects.

Subclasses could implement binary, multiclass, single-label, hard or soft classification. This class imposes no restriction on different types of classifiers.

It provides accessing to matched and mismatched elements, an ""organization"" and the current item being classified - the observation -  called ""subject"".

The organization object is responsible to hold the ""Classes"". These are NOT Smalltalk classes but Classes in the statistical classification sense (class is like a label to assign to a subject).

The classifier supports matching at different classes:

1) When using #atMatchesPut: the classifier add the parameter in a default matching entry, meaning the parameter just matched a condition.  The default class name is just #default.
2) When using #atMatchClass:put: the classifier stores the parameter in the supplied ""class"" (again, not a Smalltalk class but a String or Symbol which identifies the organization).

Instance Variables
	matches:			<Collection>
	mismatches:			<Collection>
	organization:		<Object>
	subject:				<Object>			Current observation being processed by the classifier

matches
	- xxxxx

mismatches
	- xxxxx

organization
	- xxxxx

ruleBase
	- xxxxx

subject
	- xxxxx

"
Class {
	#name : #BioClassifier,
	#superclass : #BioNamedObject,
	#instVars : [
		'organization',
		'matches',
		'mismatches',
		'subject'
	],
	#category : #'BioClassifier-Core'
}

{ #category : #accessing }
BioClassifier class >> allClassifiers [ 

	^ self allSubclasses select: #isEnabled
]

{ #category : #accessing }
BioClassifier class >> classifiers [

	^ self allClassifiers collect: #description
]

{ #category : #testing }
BioClassifier class >> isEnabled [

	^ false
]

{ #category : #accessing }
BioClassifier class >> uniqueName [
	" Answer a <String> with the cound reciever instances "

	^ self allSubInstances size asString
]

{ #category : #'accessing-organization' }
BioClassifier >> addOrganizationClass: aBioOrganization [
	" Add aBioOrganization as receiver's class/label "

	self organization addClass: aBioOrganization
]

{ #category : #accessing }
BioClassifier >> atMatchClass: className put: instanceObject [
	" Classify instanceObject into the receiver's matches at className "
	
	self matches 
		at: className
		ifPresent: [ : elem | (matches at: className) add: instanceObject ]
		ifAbsent: [
			matches 
				at: className
				put: (OrderedCollection new add: instanceObject; yourself) ].
]

{ #category : #accessing }
BioClassifier >> atMatches [
	"Answer a <Collection> with the default matched elements"
	
	^ self matches 
		at: #default
		ifAbsentPut: [ OrderedCollection new ]
]

{ #category : #accessing }
BioClassifier >> atMatchesPut: anObject [
	" Add anObject to the receiver's matched elements "

	^ self atMatchClass: #default put: anObject


]

{ #category : #accessing }
BioClassifier >> atMismatch: selectedMismatchFeatures [
	"Answer the mismatch corresponding to selectedMismatchFeatures"

	| nonEmptyFeatureValues |
	nonEmptyFeatureValues := selectedMismatchFeatures reject: [ : featureValue | featureValue = '-' ].
	^ self mismatches 
		detect: [ : d | d values bioHasEqualElements: nonEmptyFeatureValues ]
		ifNone: [ self inform: selectedMismatchFeatures asString , ' not found' ]
]

{ #category : #accessing }
BioClassifier >> atMismatchesPut: anObject [
	"Take an action when the receiver's subect cannot be classified"
	
	self mismatches add: anObject

]

{ #category : #'accessing-organization' }
BioClassifier >> classesSize [
	" Answer how many classes the receiver contains. "
	
	^ self organization classesSize
]

{ #category : #accessing }
BioClassifier >> classificationsSize [
	" Answer a <Number> of how many observations were classified "

	^ self matches 
		ifNotEmpty: [ : m | m sum: #size ] 
		ifEmpty: [  0 ]
	
]

{ #category : #accessing }
BioClassifier >> classify: aSubject [
	" Answer <true> if aSubject was classified in any receiver's organization "

	| group |
	(group := self organization groupFor: aSubject)
		ifNotNil: [ :arg | 
			self atMatchesPut: aSubject.
			group addClassification: aSubject ]
		ifNil: [ self atMismatchesPut: aSubject ].
	^ group isNil not
]

{ #category : #accessing }
BioClassifier >> groupBy: anObject [

	| newClassifications |
	
	newClassifications := OrderedCollection new.
	self organizationContents collect: [ : org | newClassifications add: (org groupBy: anObject) ].
	^ newClassifications

]

{ #category : #testing }
BioClassifier >> hasClassifications [ 
	" Answer <true> if receiver has matches or mismatches from a classification "

	^ (self matches notNil and: [ self matches notEmpty ])
		or: [ self mismatches notNil and: [ self mismatches notEmpty ] ]
]

{ #category : #initialization }
BioClassifier >> initialize [
	"Private - Reset receiver to an initial state"

	super initialize.
	self initializeName.

]

{ #category : #'initialize-release' }
BioClassifier >> initializeName [
	" Private - Initialize receiver's unique name. This is to ensure we can have several classifiers for a case study "
	
	self addUniqueName: (String streamContents: [ : stream |
		stream 
			nextPutAll: self class uniqueName 
			between: $[ and: $] ])
]

{ #category : #accessing }
BioClassifier >> matched: aSymbol [
	" Take an action when the receiver's subject was classified "
	
	self matches
		at: aSymbol
		ifPresent: [ : elem | (matches at: aSymbol) add: self subject ]
		ifAbsent: [
			matches 
				at: aSymbol 
				put: (OrderedCollection new add: self subject; yourself) ].

]

{ #category : #accessing }
BioClassifier >> matches [

	^ matches 
		ifNil: [ matches := Dictionary new  ].

]

{ #category : #accessing }
BioClassifier >> matches: anObject [
	matches := anObject
]

{ #category : #'accessing-output' }
BioClassifier >> maxClass [
	" Answer the class which has been assigned by the receiver with the maximum number of features "

	^ self organization maxClass
]

{ #category : #'accessing-output' }
BioClassifier >> maxClasses [
	" Answer how many classes could be assigned by the receiver with the maximum number of features "

	^ self organization maxClasses
]

{ #category : #'accessing-output' }
BioClassifier >> minClass [
	" Answer the class which has been assigned by the receiver with the minimum number of features "

	^ self organization minClass
]

{ #category : #'accessing-output' }
BioClassifier >> minClasses [
	" Answer how many classes could be assigned by the receiver with the minimum number of features "

	^ self organization minClasses
]

{ #category : #accessing }
BioClassifier >> mismatches [

	mismatches ifNil: [ mismatches := self newMatchingDictionary: #all ].
	^ mismatches at: #all


		
]

{ #category : #accessing }
BioClassifier >> mismatches: anObject [

	mismatches := anObject
]

{ #category : #accessing }
BioClassifier >> newMatchingDictionary: keySymbol [
	" Private - Answer a <Dictionary> for storing matches or mismatches in the receiver "

	^ Dictionary new 
		at: keySymbol put: OrderedCollection new;
		yourself
]

{ #category : #'accessing-organization' }
BioClassifier >> organization [

	^ organization

]

{ #category : #'accessing-organization' }
BioClassifier >> organization: anObject [
	organization := anObject
]

{ #category : #'accessing-organization' }
BioClassifier >> organizationAt: aString [

	^ self organization organizationAt: aString
]

{ #category : #'accessing-organization' }
BioClassifier >> organizationClasses [
	
	^ self organization 
		ifNil: [ Array empty ] 
		ifNotNil: [ self organization classes ].
]

{ #category : #'accessing-organization' }
BioClassifier >> organizationContents [

	^ self organization contents
]

{ #category : #'accessing-organization' }
BioClassifier >> organizationRelease [
	" Clean organization "
	
	self organization: nil.

]

{ #category : #printing }
BioClassifier >> printClassificationsOn: aStream [

	aStream 
		space;
		nextPutAll: self classificationsSize asString between: $( and: Character space;
		nextPutAll: 'in'; 
		nextPutAll: self classesSize asString between: Character space and: $)

]

{ #category : #printing }
BioClassifier >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	organization
		ifNotNil: [ self printClassificationsOn: aStream ]

]

{ #category : #accessing }
BioClassifier >> releaseClassifications [

	self organization releaseClassifications.
	self mismatches: nil.
	self matches: nil.
]

{ #category : #accessing }
BioClassifier >> removeMatch: anObject [
	" Remove anObject from the matched elements "
	
	^ self matches 
		detect: [ : d | d includes: anObject ]
		ifFound: [ : found | found remove: anObject ]
]

{ #category : #accessing }
BioClassifier >> removeMismatch: anObject [
	" Remove anObject from the matched elements "

	^ self mismatches 
		detect: [ : d | d includes: anObject ]
		ifFound: [ : found | found remove: anObject ]
		ifNone: [ self inform: anObject asString , ' not found' ]
]

{ #category : #accessing }
BioClassifier >> subject [
	^ subject
]

{ #category : #accessing }
BioClassifier >> subject: anObject [
	subject := anObject
]
