"
Describes a software installation. For future usage.

Currently used to format the list of installed software.



"
Class {
	#name : #BioSoftwareItem,
	#superclass : #Object,
	#instVars : [
		'softwareName',
		'softwareVersion',
		'isInstalled',
		'description',
		'link',
		'classifications',
		'entryPoint'
	],
	#category : 'BioSoftwareCatalog-Core'
}

{ #category : #comparing }
BioSoftwareItem >> = aBioSoftwareItem [

	^ self softwareName = aBioSoftwareItem softwareName
]

{ #category : #accessing }
BioSoftwareItem >> classifications [
	^ classifications
]

{ #category : #accessing }
BioSoftwareItem >> classifications: anObject [
	classifications := anObject
]

{ #category : #accessing }
BioSoftwareItem >> description [
	" Answer a <String> representing receiver description text "
	
	^ description
		ifNil: [ description := String new ]
]

{ #category : #accessing }
BioSoftwareItem >> description: aString [
	" Set aString as receiver human-readable description text "
	
	description := aString
]

{ #category : #accessing }
BioSoftwareItem >> entryPoint [
	^ entryPoint
]

{ #category : #accessing }
BioSoftwareItem >> entryPoint: anObject [
	entryPoint := anObject
]

{ #category : #comparing }
BioSoftwareItem >> hash [

	^ self softwareName hash
]

{ #category : #testing }
BioSoftwareItem >> isInstalled [
	^ isInstalled
]

{ #category : #accessing }
BioSoftwareItem >> link [
	^ link
]

{ #category : #accessing }
BioSoftwareItem >> link: anObject [
	link := anObject
]

{ #category : #printing }
BioSoftwareItem >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	aStream 
		nextPut: $[;
		nextPutAll: self softwareName;
		nextPut: $]
]

{ #category : #testing }
BioSoftwareItem >> setInstalled [

	isInstalled := true
]

{ #category : #accessing }
BioSoftwareItem >> softwareName [
	" Answer a <String> of the receiver's main name "
	
	^ softwareName
]

{ #category : #accessing }
BioSoftwareItem >> softwareName: aString [
	" Set aString as the receiver's main name "
	
	softwareName := aString
]

{ #category : #accessing }
BioSoftwareItem >> softwareVersion [
	" Answer a <String> representing the receiver's version "

	^ softwareVersion
		ifNil: [ softwareVersion := 'Unknown Version' ]
]

{ #category : #accessing }
BioSoftwareItem >> softwareVersion: aString [
	" Set aString representing the receiver's version "
	
	softwareVersion := aString
]
