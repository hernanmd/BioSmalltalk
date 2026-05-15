"
Represents a SHEET record in a PDB file. Instance Variables: strandNumber sheetID numStrands
"
Class {
	#name : 'BioPDBSheetRecord',
	#superclass : 'BioPDBRecord',
	#instVars : [
		'strandNumber',
		'sheetID',
		'numStrands'
	],
	#category : 'BioParsers-PDB',
	#package : 'BioParsers',
	#tag : 'PDB'
}

{ #category : 'accessing' }
BioPDBSheetRecord >> numStrands [
	^ numStrands
]

{ #category : 'accessing' }
BioPDBSheetRecord >> numStrands: aNumber [
	numStrands := aNumber
]

{ #category : 'accessing' }
BioPDBSheetRecord >> sheetID [
	^ sheetID
]

{ #category : 'accessing' }
BioPDBSheetRecord >> sheetID: aString [
	sheetID := aString
]

{ #category : 'accessing' }
BioPDBSheetRecord >> strandNumber [
	^ strandNumber
]

{ #category : 'accessing' }
BioPDBSheetRecord >> strandNumber: aNumber [
	strandNumber := aNumber
]
