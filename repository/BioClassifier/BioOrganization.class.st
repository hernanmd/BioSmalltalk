"
BioOrganization holds a feature (recurrent elements in a set) which could be thought as a trained element in a set, and matchedElements for that feature in a classification process.

It is intended to be used as element of a BioGroupOrganization which is used by a BioClassifier.

Instance Variables:
	matchedElements	<ProtoObject | PseudoContext>
	feature				<ProtoObject | PseudoContext>
"
Class {
	#name : #BioOrganization,
	#superclass : #BioNamedObject,
	#instVars : [
		'matchedElements',
		'feature'
	],
	#category : #'BioClassifier-Core'
}

{ #category : #accessing }
BioOrganization >> addClassification: anObject [
	"Add anObject to the receiver's matches. Answer the receiver"

	self classifications add: anObject
]

{ #category : #accessing }
BioOrganization >> classifications [

	^ matchedElements
		ifNil: [ matchedElements := self matchClass new ]
]

{ #category : #accessing }
BioOrganization >> classifications: anObject [
	matchedElements := anObject
]

{ #category : #accessing }
BioOrganization >> feature [
	^ feature

]

{ #category : #accessing }
BioOrganization >> feature: anObject [
	feature := anObject
]

{ #category : #accessing }
BioOrganization >> groupBy: selector [

	^ self classifications groupedBy: [: classification | 
		classification contents perform: selector ]
]

{ #category : #accessing }
BioOrganization >> matchClass [
	"Private - Answer a <Collection class> used to store matched elements"

	^ OrderedCollection
]

{ #category : #printing }
BioOrganization >> printOn: aStream [
	"Private - See superimplementor's comment"
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: 'Class:';
		nextPutAll: self name;
		space;
		nextPutAll: 'Matches: ';
		nextPutAll: self classifications size asString;
		space;
		nextPutAll: self feature asString 
		between: $[ and: $];
		cr
]

{ #category : #accessing }
BioOrganization >> releaseClassifications [

	matchedElements := nil
]

{ #category : #accessing }
BioOrganization >> size [
	"Answer a <Number> representing how many objects had organized or classified the receiver"

	^ self classifications size
]
