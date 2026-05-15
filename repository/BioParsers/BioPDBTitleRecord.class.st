"
Represents a TITLE record in a PDB file. Instance Variables: continuationNumber title
"
Class {
	#name : 'BioPDBTitleRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'continuationNumber',
		'title'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBTitleRecord >> continuationNumber [
	^ continuationNumber
]

{ #category : 'accessing' }
BioPDBTitleRecord >> continuationNumber: aString [
	continuationNumber := aString
]

{ #category : 'accessing' }
BioPDBTitleRecord >> title [
	^ title
]

{ #category : 'accessing' }
BioPDBTitleRecord >> title: aString [
	title := aString
]
