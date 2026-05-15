"
Abstract base class for PDB file records. Instance Variables: recordType line
"
Class {
	#name : 'BioPDBRecord',
	#superclass : 'BioObject',
	#instVars : [
		'recordType',
		'line'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'testing' }
BioPDBRecord >> isAtomRecord [
	^ false
]

{ #category : 'testing' }
BioPDBRecord >> isSeqResRecord [
	^ false
]

{ #category : 'accessing' }
BioPDBRecord >> line [
	^ line
]

{ #category : 'accessing' }
BioPDBRecord >> line: aString [
	line := aString
]

{ #category : 'accessing' }
BioPDBRecord >> recordType [
	^ recordType
]

{ #category : 'accessing' }
BioPDBRecord >> recordType: aString [
	recordType := aString
]
