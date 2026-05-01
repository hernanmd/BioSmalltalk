Class {
	#name : 'BioPDBHelixRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'serialNumber',
		'helixID',
		'initResName',
		'initChainID',
		'initSeqNum',
		'initICode',
		'endResName',
		'endChainID',
		'endSeqNum',
		'endICode',
		'helixClass'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBHelixRecord >> endChainID [
	^ endChainID
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endChainID: aString [
	endChainID := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endICode [
	^ endICode
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endICode: aString [
	endICode := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endResName [
	^ endResName
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endResName: aString [
	endResName := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endSeqNum [
	^ endSeqNum
]

{ #category : 'accessing' }
BioPDBHelixRecord >> endSeqNum: aNumber [
	endSeqNum := aNumber
]

{ #category : 'accessing' }
BioPDBHelixRecord >> helixClass [
	^ helixClass
]

{ #category : 'accessing' }
BioPDBHelixRecord >> helixClass: aNumber [
		helixClass := aNumber
]

{ #category : 'accessing' }
BioPDBHelixRecord >> helixID [
	^ helixID
]

{ #category : 'accessing' }
BioPDBHelixRecord >> helixID: aString [
		helixID := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initChainID [
	^ initChainID
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initChainID: aString [
	initChainID := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initICode [
	^ initICode
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initICode: aString [
	initICode := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initResName [
	^ initResName
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initResName: aString [
	initResName := aString
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initSeqNum [
	^ initSeqNum
]

{ #category : 'accessing' }
BioPDBHelixRecord >> initSeqNum: aNumber [
	initSeqNum := aNumber
]

{ #category : 'accessing' }
BioPDBHelixRecord >> serialNumber [
	^ serialNumber
]

{ #category : 'accessing' }
BioPDBHelixRecord >> serialNumber: aNumber [
	serialNumber := aNumber
]
