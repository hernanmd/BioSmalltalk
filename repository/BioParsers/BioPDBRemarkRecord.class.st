Class {
	#name : 'BioPDBRemarkRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'remarkNumber'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBRemarkRecord >> remarkNumber [
	^ remarkNumber
]

{ #category : 'accessing' }
BioPDBRemarkRecord >> remarkNumber: aString [
	remarkNumber := aString
]
