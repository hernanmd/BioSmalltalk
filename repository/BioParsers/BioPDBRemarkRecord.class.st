"
Represents a REMARK record in a PDB file. Instance Variables: remarkNumber
"
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
