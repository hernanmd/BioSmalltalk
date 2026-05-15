"
Represents a MODEL record in a PDB file. Instance Variables: serialNumber
"
Class {
	#name : 'BioPDBModelRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'serialNumber'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBModelRecord >> serialNumber [
	^ serialNumber
]

{ #category : 'accessing' }
BioPDBModelRecord >> serialNumber: aNumber [
	serialNumber := aNumber
]
