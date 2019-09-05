"
Helper class for storing SNP positions with averages.

    Instance Variables
	average:		<Object>
	position:		<Object>


    Implementation Points
"
Class {
	#name : #BioSNPAncestry,
	#superclass : #BioNamedObject,
	#instVars : [
		'position',
		'average'
	],
	#category : 'BioLAMPLD-Visualization'
}

{ #category : #accessing }
BioSNPAncestry >> average [
	^ average
]

{ #category : #accessing }
BioSNPAncestry >> average: anObject [
	average := anObject
]

{ #category : #accessing }
BioSNPAncestry >> position [
	^ position
]

{ #category : #accessing }
BioSNPAncestry >> position: anObject [
	position := anObject
]

{ #category : #accessing }
BioSNPAncestry >> positionAsStringWithCommas [
	" Answer a <String> representation of the receiver's position separated with commas "

	^ self position asStringWithCommas
]

{ #category : #printing }
BioSNPAncestry >> printOn: aStream [
	" Private - See superimplementor's comment "

	aStream
		nextPutAll: 'Pos: ';
		nextPutAll: self position asString;
		nextPutTerminator;
		nextPutAll: 'Avg: ';
		nextPutAll: self average asString		
]
