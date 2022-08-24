"
A Matrix formatter is a generic writer for matrix objects. For example to export a matrix where each row is delimited by spaces evaluate:

| myMatrixWriter |

myMatrixWriter := (BioMatrixFormatter new initMatrixRows: 10 columns: 2)
	atColumn: 1 fillWith: (BioObject generate: 1 repeat: 10);
	atColumn: 2 fillWith: ((1 to: 10) collect: #asNumber);
	yourself.
myMatrixWriter exportMatrix.

Subclasses should override the 'exporting' protocol accordingly to their specific matrix formatting.

Instance Variables:
	matrix	<DhbMatrix>
	
"
Class {
	#name : #BioMatrixFormatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'matrix',
		'delimiter'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #accessing }
BioMatrixFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'Generic Matrix Formatter/Writer'
]

{ #category : #accessing }
BioMatrixFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'txt'

]

{ #category : #accessing }
BioMatrixFormatter >> atColumn: aNumber [

	^ self matrix atColumn: aNumber
]

{ #category : #populating }
BioMatrixFormatter >> atColumn: aNumber fillWith: aValue [

	aValue 
		fillMatrix: self matrix 
		atColumn: aNumber

]

{ #category : #populating }
BioMatrixFormatter >> atColumn: colNumber fillWith: aValue repeat: repNumber [
	" Repeat repNumber times, aValue in column colNumber 
	Example: self atColumn: 1 fillWith: 'BM1818' repeat: 3
	produces
	[ 'BM1818' nil nil nil 
	'BM1818' nil nil nil 	
	'BM1818' nil nil nil 	
	nil nil nil nil 			
	nil nil nil nil ]
	"
	aValue 
		fillMatrix: self matrix 
		atColumn: colNumber 
		repeat: repNumber

]

{ #category : #populating }
BioMatrixFormatter >> atColumn: aColumnNumber fillWith: aValue startingAt: rowNumber [
	" Fill the receiver's matrix with aValue at aColumnNumber beggining at rowNumber. rowNumber must be >= 1 "

	aValue 
		fillMatrix: self matrix 
		atColumn: aColumnNumber 
		startingAt: rowNumber

]

{ #category : #populating }
BioMatrixFormatter >> atRow: aNumber fillWith: aValue [

	aValue 
		fillMatrix: self matrix 
		atRow: aNumber

]

{ #category : #populating }
BioMatrixFormatter >> atRow: rowNumber fillWith: aValue startingAt: columnNumber [
	" Fill the receiver's matrix with aValue at rowNumber beggining at columnNumber. columnNumber must be >= 1 "

	self assert: columnNumber >= 1.
	aValue 
		fillMatrix: self matrix 
		atRow: rowNumber 
		startingAt: columnNumber

]

{ #category : #accessing }
BioMatrixFormatter >> delimiter [
	" Answer a <Character> used to delimit fields. Do not use lazy initialization "

	^ delimiter

]

{ #category : #accessing }
BioMatrixFormatter >> delimiter: aCharacter [
	" Set aCharacter as delimiter for the receiver's fields "

	delimiter := aCharacter
]

{ #category : #accessing }
BioMatrixFormatter >> do: aBlock [
	" Iterate through the receiver's elements "

	^ self matrix rowsDo: aBlock
]

{ #category : #exporting }
BioMatrixFormatter >> exportCellAtRow: rowIndex atColumn: colIndex [
	" Private - Assume matrix contents at rowIndex and colIndex are not nil. "

	self outputFileStream nextPutAll: (matrix at: rowIndex at: colIndex) asString.
	self exportCellDelimiter.
]

{ #category : #exporting }
BioMatrixFormatter >> exportCellAtRow: rowIndex atColumn: colIndex matrix: theMatrix [
	" Private - Assume matrix contents at rowIndex and colIndex are not nil. "

	self outputFileStream nextPutAll: (theMatrix at: rowIndex at: colIndex) asString.
	self exportCellDelimiter.
]

{ #category : #exporting }
BioMatrixFormatter >> exportCellDelimiter [
	" Private - Write cell separator "
	
	self outputFileStream nextPut: Character space.
]

{ #category : #exporting }
BioMatrixFormatter >> exportFirstCellColumnAt: rowIndex [
	" Write contents for the first column(s) at rowIndex position "
]

{ #category : #exporting }
BioMatrixFormatter >> exportMatrix [
	" Write the receiver's matrix to a file "
	
	self bioLog: 'Started writing matrix to file...'.
	self exportMatrix: self matrix.
	self bioLog: 'Finished writing matrix to file'.
]

{ #category : #exporting }
BioMatrixFormatter >> exportMatrix: theMatrix [

	1 to: theMatrix numberOfRows do: [: rowIndex |
		self exportFirstCellColumnAt: rowIndex.
		1 to: theMatrix numberOfColumns do: [: colIndex |
			self exportCellAtRow: rowIndex atColumn: colIndex matrix: theMatrix ].
		self outputFileStream cr ].
	self outputFileStream close.
]

{ #category : #exporting }
BioMatrixFormatter >> fileNamePrefix [
	" Answer a String for prefixing the output file name "
	
	^ 'BioST-Exported-Matrix_'
]

{ #category : #accessing }
BioMatrixFormatter >> initMatrixRows: rowsNumber columns: columnsNumber [
	" Private - Initialize the receiver's matrix with rowsNumber and columnsNumber "
	
	matrix := self matrixClass rows: rowsNumber columns: columnsNumber.	
]

{ #category : #accessing }
BioMatrixFormatter >> matrix [
	" Answer the receiver's matrix "

	^ matrix
]

{ #category : #accessing }
BioMatrixFormatter >> matrix: anObject [
	" Set the receiver's internal matrix "

	matrix := anObject
]

{ #category : #accessing }
BioMatrixFormatter >> matrixClass [
	" Answer a <Class> used for matrices in the receiver "

	^ PMMatrix

]

{ #category : #accessing }
BioMatrixFormatter >> size [
	" Answer how many elements has the receiver's matrix "

	^ self matrix size
]
