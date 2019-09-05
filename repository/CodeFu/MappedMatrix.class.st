Class {
	#name : #MappedMatrix,
	#superclass : #MatrixDecorator,
	#instVars : [
		'columnMap',
		'rowMap'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
MappedMatrix class >> on: aMatrix [

	^self on: aMatrix rowMap: nil columnMap: nil
]

{ #category : #'instance creation' }
MappedMatrix class >> on: aMatrix columnMap: columnReindexing [

	^self on: aMatrix rowMap: nil columnMap: columnReindexing
]

{ #category : #'instance creation' }
MappedMatrix class >> on: aMatrix map: aReindexing [ 

	[ aMatrix isSquare ] assert.
	^self on: aMatrix rowMap: aReindexing columnMap: aReindexing
]

{ #category : #'instance creation' }
MappedMatrix class >> on: aMatrix rowMap: rowReindexing [ 

	^self on: aMatrix rowMap: rowReindexing columnMap: nil
]

{ #category : #'instance creation' }
MappedMatrix class >> on: aMatrix rowMap: rowReindexing columnMap: columnReindexing [

	^(super on: aMatrix)
		setRowMap: rowReindexing;
		setColumnMap: columnReindexing;
		yourself.
]

{ #category : #accessing }
MappedMatrix >> at: row and: column [

	^matrix at: (rowMap at: row) and: (columnMap at: column)
]

{ #category : #accessing }
MappedMatrix >> at: row and: column put: aNumber [

	^matrix at: (rowMap at: row) and: (columnMap at: column) put: aNumber
]

{ #category : #accessing }
MappedMatrix >> columnSize [

	^columnMap size
]

{ #category : #accessing }
MappedMatrix >> rowSize [

	^rowMap size
]

{ #category : #'initialize-release' }
MappedMatrix >> setColumnMap: mapping [

	columnMap := mapping ifNil: [ NumberMapping new: matrix columnSize ]
]

{ #category : #'initialize-release' }
MappedMatrix >> setRowMap: mapping [

	rowMap := mapping ifNil: [ NumberMapping new: matrix rowSize ]
]
