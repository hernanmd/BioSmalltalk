Class {
	#name : #SparseRowMatrix,
	#superclass : #RowMatrix,
	#category : 'CodeFu'
}

{ #category : #private }
SparseRowMatrix class >> onRows: rowCollection [

	| new |
	new := self basicNew.
	new instVarNamed: 'rows' put: rowCollection asArray.
	[ new checkInvariant ] assert.
	^new
]

{ #category : #private }
SparseRowMatrix class >> vectorSpecies [

	^SparseVector
]

{ #category : #adding }
SparseRowMatrix >> addColumn [

	rows do: #addLast.
]

{ #category : #adding }
SparseRowMatrix >> addRow [

	rows := rows copyWith: (self vectorSpecies new: self columnSize)
]

{ #category : #enumerating }
SparseRowMatrix >> doSparseWithIndices: trinaryBlock [ 

	rows doWithIndex: [ :vector :row |
		vector doSparseWithIndex: [ :each :column |
			trinaryBlock value: each value: row value: column 
	]].
	^self
]

{ #category : #testing }
SparseRowMatrix >> isZeroAt: row and: column [

	^(rows at: row) isZeroAt: column
]

{ #category : #accessing }
SparseRowMatrix >> sparseSize [

	^rows inject: 0 into: [ :sum :each | sum + each sparseSize ]
]

{ #category : #printing }
SparseRowMatrix >> storeOn: stream [

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
