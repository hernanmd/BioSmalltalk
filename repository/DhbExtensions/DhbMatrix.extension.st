Extension { #name : #DhbMatrix }

{ #category : #'*dhbExtensions' }
DhbMatrix >> at: aRowIndex at: aColumnIndex [
		"Answers the aRowIndex-th, aColumnIndex-th entry in the receiver.
		 (c) Copyrights Joseph WHITESELL, 2001, all rights reserved.
		 Initial code: 08/17/2001 "
	^ self rowAt: aRowIndex columnAt: aColumnIndex
]

{ #category : #'*dhbExtensions' }
DhbMatrix >> at: rowIndex at: columnIndex put: value [

	self rowAt: rowIndex columnAt: columnIndex put: value
	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atAllPut: element [ 
	"Put element at every one of the receiver's cells."

	self rowsDo: [ : row | row atAllPut: element ]
]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atColumn: anInteger [

	^ self columnAt: anInteger
]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atColumn: aColumnIndex put: aCollection [

	aCollection withIndexDo: [: value : rowIndex |
		self rowAt: rowIndex columnAt: aColumnIndex put: value ]
	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atColumn: columnIndex put: aValue repeat: repNumber [
	"	Example: self atColumn: 1 fillWith: 'BM1818' repeat: 3
	produces
	[ 'BM1818' nil nil nil 
	'BM1818' nil nil nil 	
	'BM1818' nil nil nil 	
	nil nil nil nil 			
	nil nil nil nil ]
"
	1 to: repNumber do: [ : index | 
		self rowAt: index columnAt: columnIndex put: aValue ].

	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atColumn: aColumnNumber put: aCollection startingAt: rowNumber [
	" Fill the receiver with aCollection at aColumnNumber beggining
	at rowNumber. "
	
	aCollection withIndexDo: [: value : rowIndex |
		self rowAt: rowIndex + rowNumber
			columnAt: aColumnNumber 
			put: value ]
	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atRow: rowIndex put: aCollection [

	aCollection withIndexDo: [: value : columnIndex |
		self rowAt: rowIndex columnAt: columnIndex put: value ]
	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> atRow: rowIndex put: aCollection startingAt: startColumnNumber [ 
	" Fill the receiver with aCollection at rowIndex beggining at startColumnNumber. "
		
	aCollection withIndexDo: [: value : columnIndex |
		self 
			rowAt: rowIndex 
			columnAt: columnIndex + startColumnNumber
			put: value ]
	

]

{ #category : #'*dhbExtensions' }
DhbMatrix >> initializeRows: rowsInteger columns: columnsInteger [
	"Build empty components for a matrix."
		
	rows := ( 1 to: rowsInteger ) asVector collect: [ :each | DhbVector new: columnsInteger ].
]

{ #category : #'*dhbExtensions' }
DhbMatrix classSide >> rows: rowsInteger columns: columnsInteger [

	^ self new initializeRows: rowsInteger columns: columnsInteger
]

{ #category : #'*dhbExtensions' }
DhbMatrix classSide >> rows: nRows columns: nCols  element: fillElement [
	" Answer a new matrix of nRows x nCols initialized with fillElement in all cells "

	^ (self new initializeRows: nRows columns: nCols)
		atAllPut: fillElement;
		yourself
]
