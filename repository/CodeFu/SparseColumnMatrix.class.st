Class {
	#name : #SparseColumnMatrix,
	#superclass : #ColumnMatrix,
	#category : 'CodeFu'
}

{ #category : #private }
SparseColumnMatrix class >> vectorSpecies [

	^SparseVector
]

{ #category : #adding }
SparseColumnMatrix >> addColumn [

	columns := columns copyWith: (self vectorSpecies new: self rowSize)
]

{ #category : #adding }
SparseColumnMatrix >> addRow [

	columns do: #addLast.
]

{ #category : #enumerating }
SparseColumnMatrix >> doSparseWithIndices: trinaryBlock [ 

	columns doWithIndex: [ :vector :column |
		vector doSparseWithIndex: [ :each :row |
			trinaryBlock value: each value: row value: column 
	]].
	^self
]

{ #category : #testing }
SparseColumnMatrix >> isZeroAt: row and: column [

	^(columns at: column) isZeroAt: row
]

{ #category : #accessing }
SparseColumnMatrix >> sparseSize [

	^columns inject: 0 into: [ :sum :each | sum + each sparseSize ]
]

{ #category : #printing }
SparseColumnMatrix >> storeOn: stream [

	| text |
	text := String new writeStream.
	self storeSparseTextOn: text.
	stream
		print: self class;
		space;
		nextPutAll: #readFromSparseText:;
		space;
		print: (text contents replaceAll: Character cr with: Character space);
		space;
		nextPutAll: 'readStream'.
]
