"
Represents a HEADER record in a PDB file. Instance Variables: classification depositionDate idCode
"
Class {
	#name : 'BioPDBHeaderRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'classification',
		'depositionDate',
		'idCode'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBHeaderRecord >> classification [
	^ classification
]

{ #category : 'accessing' }
BioPDBHeaderRecord >> classification: aString [
	classification := aString
]

{ #category : 'accessing' }
BioPDBHeaderRecord >> depositionDate [
	^ depositionDate
]

{ #category : 'accessing' }
BioPDBHeaderRecord >> depositionDate: aString [
	depositionDate := aString
]

{ #category : 'accessing' }
BioPDBHeaderRecord >> idCode [
	^ idCode
]

{ #category : 'accessing' }
BioPDBHeaderRecord >> idCode: aString [
	idCode := aString
]
