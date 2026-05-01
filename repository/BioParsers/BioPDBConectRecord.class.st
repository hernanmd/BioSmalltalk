Class {
	#name : 'BioPDBConectRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'serialNumber',
		'bondedAtoms'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBConectRecord >> bondedAtoms [
	^ bondedAtoms
]

{ #category : 'accessing' }
BioPDBConectRecord >> bondedAtoms: aCollection [
	bondedAtoms := aCollection
]

{ #category : 'accessing' }
BioPDBConectRecord >> serialNumber [
	^ serialNumber
]

{ #category : 'accessing' }
BioPDBConectRecord >> serialNumber: aNumber [
	serialNumber := aNumber
]
