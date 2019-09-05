Class {
	#name : #FUMatrix,
	#superclass : #Object,
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
FUMatrix class >> new [
	"Create a new matrix with dimension zero."

	^self new: Number zero
]

{ #category : #'instance creation' }
FUMatrix class >> new: numberOrPoint [
	"Create a new square matrix with the given dimension."

	| point |
	point := numberOrPoint asPoint.
	^self rows: point x columns: point y
]

{ #category : #'instance creation' }
FUMatrix class >> new: numberOrPoint withAll: value [

	^(self new: numberOrPoint)
		atAllPut: value;
		yourself.
]

{ #category : #'instance creation' }
FUMatrix class >> readFromDenseBinary: aBinaryStream [

	" No senders found "
	" self needsWork "

"	| m n matrix stream |
	stream := NetworkByteOrderStream wrap: aBinaryStream.
	m := stream nextLong.
	n := stream nextLong.
	matrix := self rows: m columns: n.
	1 to: m do: [ :row |
		1 to: n do: [ :column |
			matrix at: row and: column put: (stream nextFloat).
		]
	].
	^matrix"
]

{ #category : #'instance creation' }
FUMatrix class >> readFromDenseText: aStream [

	| m n matrix |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n.
	1 to: m do: [ :row |
		1 to: n do: [ :column |
			matrix at: row and: column put: (Number readFrom: aStream skipSeparators).
		]
	].
	^matrix
]

{ #category : #'instance creation' }
FUMatrix class >> readFromSparseText: aStream [

	| m n matrix |
	m := Integer readFrom: aStream skipSeparators.
	n := Integer readFrom: aStream skipSeparators.
	Integer readFrom: aStream skipSeparators.
	matrix := self rows: m columns: n withAll: Number zero.
	1 to: n do: [ :column |
		1 to: (Integer readFrom: aStream skipSeparators) do: [ :unused |
			matrix at: (Integer readFrom: aStream skipSeparators) + 1 and: column put: (Number readFrom: aStream skipSeparators).
		]
	].
	^matrix
]

{ #category : #'instance creation' }
FUMatrix class >> rows: m columns: n [
	"Create a new matrix with m rows and n columns."

	^(self basicNew) 
		initializeRows: m columns: n;
		yourself
]

{ #category : #'instance creation' }
FUMatrix class >> rows: m columns: n withAll: value [

	^(self rows: m columns: n) 
		atAllPut: value;
		yourself
]

{ #category : #private }
FUMatrix class >> switch: anObject caseMatrix: matrixBlock caseNestedCollection: nestedColletionBlock caseCollection: collectionBlock default: defaultBlock [ 
	(anObject isKindOf: FUMatrix) ifTrue: [ ^ matrixBlock value ].
	(anObject isKindOf: Collection) ifTrue: 
		[ (anObject isEmpty not and: 
			[ anObject allSatisfy: 
				[ : each | 
				(each isKindOf: Collection) and: [ each size = anObject first size ] ] ]) 
			ifTrue: [ ^ nestedColletionBlock value ]
			ifFalse: [ ^ collectionBlock value ] ].
	^ defaultBlock value
]

{ #category : #'constants access' }
FUMatrix class >> unity [

	^MatrixCoercion with: 1
]

{ #category : #private }
FUMatrix class >> vectorSpecies [

	^ArrayVector
]

{ #category : #'instance creation' }
FUMatrix class >> withAll: object [

	| dimension |
	dimension := self switch: object
		caseMatrix: [ object dimension ]
		caseNestedCollection: [ object size @ object first size ]
		caseCollection: [ 1 @ object size ]
		default: [ 0 ].
	^(self new: dimension)
		atAllPut: object;
		yourself.
]

{ #category : #'constants access' }
FUMatrix class >> zero [

	^MatrixCoercion with: 0
]

{ #category : #arithmetic }
FUMatrix >> * aNumber [

	^aNumber productFromMatrix: self
]

{ #category : #arithmetic }
FUMatrix >> *= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a * b ]
]

{ #category : #'matrix functions' }
FUMatrix >> *~ aMatrix [
	"Answer the matrix multiplication of the reciever with the argument."

	| newMatrix |
	self columnSize = aMatrix rowSize ifFalse: [ Array new noMatchError ].
	newMatrix := self species rows: self rowSize columns: aMatrix columnSize.
	"workaround: this should be done in a more generic way with double dispatch."
	newMatrix putWithIndices: ((aMatrix isKindOf: DiagonalMatrix) 
		ifTrue: [ [ :i :j | (self at: i and: j ) * (aMatrix at: j and: j) ] ]
		ifFalse: [ [ :i :j | (1 to: self columnSize) inject: 0 into: [ :sum :k | sum + ((self at: i and: k) * (aMatrix at: k and: j)) ] ] ]).
	^newMatrix
]

{ #category : #arithmetic }
FUMatrix >> + aNumber [
	
	^aNumber sumFromMatrix: self
]

{ #category : #arithmetic }
FUMatrix >> += aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a + b ]
]

{ #category : #arithmetic }
FUMatrix >> - aNumber [

	^aNumber differenceFromMatrix: self
]

{ #category : #arithmetic }
FUMatrix >> -= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a - b ]
]

{ #category : #arithmetic }
FUMatrix >> / aNumber [

	^aNumber quotientFromMatrix: self
]

{ #category : #arithmetic }
FUMatrix >> /= aNumber [
	
	^self with: (self coerce: aNumber) affect: [ :a :b | a / b ]
]

{ #category : #comparing }
FUMatrix >> = matrix [ 
	"Answer whether the dimension of the receiver is the same as otherMatrix' dimension,
	and each of the receiver's elements equal the corresponding element of otherMatrix."
	^ self == matrix or: 
		[ (matrix isKindOf: FUMatrix) and: 
			[ (matrix hasDimension: self dimension) and: 
				[ self 
					with: matrix
					do: [ : a : b | a = b ifFalse: [ ^ false ] ].
				true ] ] ]
]

{ #category : #'double dispatching' }
FUMatrix >> adaptToNumber: aNumber andSend: selector [

	^self collect: [ :b | aNumber perform: selector with: b ]
]

{ #category : #'double dispatching' }
FUMatrix >> adaptToPoint: aPoint andSend: selector [

	^self collect: [ :b | aPoint perform: selector with: b ]
]

{ #category : #resizing }
FUMatrix >> addColumn [
	"Add a column. Must implement if isExtendable returns true."	
	
	self shouldNotImplement
]

{ #category : #resizing }
FUMatrix >> addColumnBeforeIndex: anIndex [
	"Insert a column before anIndex. Must implement if isResizebale returns true."

	self shouldNotImplement
]

{ #category : #resizing }
FUMatrix >> addRow [
	"Add a row. Must implement if isExtendable returns true."	
	
	self shouldNotImplement
]

{ #category : #resizing }
FUMatrix >> addRowBeforeIndex: anIndex [
	"Insert a row before anIndex. Must implement if isResizebale returns true."

	self shouldNotImplement
]

{ #category : #converting }
FUMatrix >> asArray [

	| array stream |
	array := Array new: (self rowSize * self columnSize).
	stream := WriteStream on: array.
	self do: [ :each | stream nextPut: each ].
	^array.
]

{ #category : #accessing }
FUMatrix >> at: row and: column [
	"Answer the vakue at the given indices."

	^self subclassResponsibility
]

{ #category : #arithmetic }
FUMatrix >> at: row and: column add: aNumber [
	"Add aNumber to the element at row and column.  Answer the sum."

	^self at: row and: column put: ((self at: row and: column) + aNumber)
]

{ #category : #arithmetic }
FUMatrix >> at: row and: column divide: aNumber [
	"Divide the element at row and column by aNumber.  Answer the quotient."

	^self at: row and: column put: ((self at: row and: column) / aNumber)
]

{ #category : #arithmetic }
FUMatrix >> at: row and: column multiply: aNumber [
	"Multiply aNumber with the element at row and column.  Answer the product."

	^self at: row and: column put: ((self at: row and: column) * aNumber)
]

{ #category : #accessing }
FUMatrix >> at: row and: column put: aNumber [
	"Store the vakue at the given indices."

	^self subclassResponsibility
]

{ #category : #arithmetic }
FUMatrix >> at: row and: column subtract: aNumber [
	"Subtract aNumber from the element at row and column.  Answer the difference."

	^self at: row and: column put: ((self at: row and: column) - aNumber)
]

{ #category : #accessing }
FUMatrix >> atAllPut: object [

	self class switch: object
		caseMatrix: [
			self with: object affect: [ :a :b | b ].
		]
		caseNestedCollection: [
			object size = self rowSize 
				ifTrue: [ 
					[ object first size = self columnSize ] assert. 
					self putWithIndices: [ :row :column | (object at: row) at: column	] 
				] 
				ifFalse: [ object size = self columnSize 
					ifTrue: [ 
						[ object first size = self rowSize ] assert. 
						self putWithIndices: [ :row :column | (object at: column) at: row ] 
					]
					ifFalse: [ Error raise ]
				]
		]
		caseCollection: [	
			| stream |
			[ object size = (self rowSize * self columnSize) ] assert.
			stream := ReadStream on: object.
			self withIndices: [ :row :column |
				self at: row and: column put: stream next
			].
		]
		default: [
			self withIndices: [ :row :column |
				self at: row and: column put: object
			].
		].
	^object.
]

{ #category : #accessing }
FUMatrix >> atPoint: rowColumnCoordinate [

	^self at: rowColumnCoordinate x and: rowColumnCoordinate y
]

{ #category : #accessing }
FUMatrix >> atPoint: rowColumnCoordinate put: aNumber [

	^self at: rowColumnCoordinate x and: rowColumnCoordinate y put: aNumber
]

{ #category : #private }
FUMatrix >> checkInvariant [

	^self subclassResponsibility
]

{ #category : #coercing }
FUMatrix >> coerce: aNumber [

	^MatrixCoercion with: aNumber
]

{ #category : #enumerating }
FUMatrix >> collect: aBlock [

	| newMatrix |
	newMatrix := self copyEmpty.
	self withIndices: [ :row :column |
		newMatrix at: row and: column put: (aBlock value: (self at: row and: column))
	].
	^newMatrix
]

{ #category : #'accessing vectorwise' }
FUMatrix >> columnAt: columnIndex [

	^MatrixPath column: columnIndex on: self
]

{ #category : #'accessing vectorwise' }
FUMatrix >> columnAt: columnIndex put: vector [

	vector doWithIndex: [ :each :row |
		self at: row and: columnIndex put: each 
	].
	^vector
]

{ #category : #accessing }
FUMatrix >> columnSize [

	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
FUMatrix >> columns [

	| array |
	array := Array new: self columnSize.
	1 to: self columnSize do: [ :index | array at: index put: (self columnAt: index) ].
	^array
]

{ #category : #copying }
FUMatrix >> copyEmpty [
	"Answer a copy of the receiver that contains no elements."

	^self copyEmpty: self dimension
]

{ #category : #copying }
FUMatrix >> copyEmpty: dimension [
	"Answer a copy of the receiver that contains no elements."

	^self species new: dimension
]

{ #category : #copying }
FUMatrix >> deepCopy [

	^self species withAll: self
]

{ #category : #accessing }
FUMatrix >> density [

	^self sparseSize / self size
]

{ #category : #arithmetic }
FUMatrix >> determinant [
	| a11 a12 a21 a22 |
	[ self hasDimension: 2@2 ] assert.
	a11 := self atPoint: 1@1.
	a12 := self atPoint: 1@2.
	a21 := self atPoint: 2@1.
	a22 := self atPoint: 2@2.

	^(a11 * a22) - (a12 * a21).
]

{ #category : #'accessing vectorwise' }
FUMatrix >> diagonal [

	^MatrixPath diagonalOn: self
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromDouble: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromFixedPoint: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromFloat: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromFraction: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromInteger: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromMatrix: aMatrix [

	^aMatrix with: self collect: [ :a :b | a - b ]
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromNumber: aNumber [

	^self collect: [ :b | aNumber - b ]
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromPoint: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> differenceFromSmallDouble: aNumber [

	^self differenceFromNumber: aNumber
]

{ #category : #accessing }
FUMatrix >> dimension [

	^self rowSize @ self columnSize
]

{ #category : #enumerating }
FUMatrix >> do: aBlock [

	self withIndices: [ :row :column | aBlock value: (self at: row and: column) ].
	^self
]

{ #category : #enumerating }
FUMatrix >> doSparseWithIndices: eachRowColumnBlock [ 

	self doWithIndices: [ :each :row :column | 
		each isZero ifFalse: [ eachRowColumnBlock value: each value: row value: column]
	].
	^self
]

{ #category : #enumerating }
FUMatrix >> doWithIndices: eachRowColumnBlock [ 

	self withIndices: [ :row :column |
		eachRowColumnBlock value: (self at: row and: column) value: row value: column
	].
]

{ #category : #accessing }
FUMatrix >> first [

	^self at: 1 and: 1
]

{ #category : #coercing }
FUMatrix >> generality [

	^240
]

{ #category : #testing }
FUMatrix >> hasDimension: aDimension [

	^self dimension = aDimension
]

{ #category : #comparing }
FUMatrix >> hash [

	^(self dimension hash bitXor: (self at: 1) hash) bitXor: (self at: self dimension) hash
]

{ #category : #'initialize-release' }
FUMatrix >> initializeRows: m columns: n [

	^self subclassResponsibility
]

{ #category : #enumerating }
FUMatrix >> inject: value into: aBlock [

	| result |
	result := value.
	self do: [:each | result := aBlock value: result value: each].
	^result
]

{ #category : #testing }
FUMatrix >> isComplex [

	^false
]

{ #category : #testing }
FUMatrix >> isDiagonal [
	"Answer if the reciever is a diagonal matrix."

	self isSquare ifFalse: [ ^false ].
	self doSparseWithIndices: [ :value :row :column |
		row = column ifFalse: [ ^false ]
	].
	^true
]

{ #category : #testing }
FUMatrix >> isResizeable [

	^false
]

{ #category : #testing }
FUMatrix >> isSquare [
	"Answer if the reciever is a square matrix."

	^self rowSize = self columnSize
]

{ #category : #testing }
FUMatrix >> isSymetric [
	"Answer if the reciever is a symetric matrix."

	self isSquare ifFalse: [ ^false ].
	1 to: self columnSize do: [ :column |
		1 to: column do: [ :row |
			(self at: column and: row) = (self at: row and: column) ifFalse: [ ^false ] 
		]
	].
	^true
]

{ #category : #testing }
FUMatrix >> isZero [
	"Answer if the reciever contains no non-zero numbers."

	self doSparseWithIndices: [ :value :row :column | ^false ].
	^true
]

{ #category : #testing }
FUMatrix >> isZeroAt: row and: column [

	^(self at: row and: column) isZero
]

{ #category : #accessing }
FUMatrix >> last [

	^self at: self rowSize and: self columnSize
]

{ #category : #private }
FUMatrix >> noMatchError [

	Error raise
]

{ #category : #private }
FUMatrix >> noModificationError [

	Error raise
]

{ #category : #printing }
FUMatrix >> printOn: aStream [ 
	"Append to the argument aStream a sequence of characters that identifies the matrix."

	| tooMany |
	tooMany := aStream position + 5000.
	aStream 
		print: self class; 
		space;
		print: self dimension;
		space;
		nextPut: $(.
	(1 to: self rowSize) do: [ :row |
		aStream nextPut: $(.
		(1 to: self columnSize) do: [ :column | 
			aStream position > tooMany ifTrue: [aStream nextPutAll: (#etc << #dialogs >> '...etc...') asString, '))'. ^self].
			aStream print: (self at: row and: column)
		] separatedBy: [ aStream space ].
		aStream nextPut: $) 
	] separatedBy: [ aStream space ].
	aStream nextPut: $)
]

{ #category : #'double dispatching' }
FUMatrix >> productFromDouble: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromFixedPoint: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromFloat: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromFraction: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromInteger: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromMatrix: aMatrix [

	^aMatrix with: self collect: [ :a :b | a * b ]
]

{ #category : #'double dispatching' }
FUMatrix >> productFromNumber: aNumber [

	^self collect: [ :b | aNumber * b ]
]

{ #category : #'double dispatching' }
FUMatrix >> productFromPoint: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> productFromSmallDouble: aNumber [

	^self productFromNumber: aNumber
]

{ #category : #enumerating }
FUMatrix >> putWithIndices: rowColumnBlock [

	self withIndices: [ :row :column |
		self at: row and: column put: (rowColumnBlock value: row value: column)
	].
	^self
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromDouble: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromFixedPoint: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromFloat: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromFraction: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromInteger: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromMatrix: aMatrix [

	^aMatrix with: self collect: [ :a :b | a / b ]
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromNumber: aNumber [

	^self collect: [ :b | aNumber / b ]
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromPoint: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> quotientFromSmallDouble: aNumber [

	^self quotientFromNumber: aNumber
]

{ #category : #arithmetic }
FUMatrix >> reciprocal [

	^self collect: [ :each | each isZero ifTrue: [ each ] ifFalse: [ each reciprocal ] ].
]

{ #category : #converting }
FUMatrix >> remap: mapping [

	^MappedMatrix on: self rowMap: mapping columnMap: mapping
]

{ #category : #resizing }
FUMatrix >> removeColumnAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #resizing }
FUMatrix >> removeRowAtIndex: anIndex [
	
	self shouldNotImplement
]

{ #category : #testing }
FUMatrix >> respondsToArithmetic [
	"We are arithmetic, yes."

	^true
]

{ #category : #arithmetic }
FUMatrix >> roundTo: aNumber [

	^self collect: [ :each | each roundTo: aNumber ].
]

{ #category : #'accessing vectorwise' }
FUMatrix >> rowAt: rowIndex [

	^MatrixPath row: rowIndex on: self
]

{ #category : #'accessing vectorwise' }
FUMatrix >> rowAt: rowIndex put: vector [

	vector doWithIndex: [ :each :column |
		self at: rowIndex and: column put: each 
	].
	^vector
]

{ #category : #accessing }
FUMatrix >> rowSize [

	^self subclassResponsibility
]

{ #category : #'accessing vectorwise' }
FUMatrix >> rows [

	| array |
	array := Array new: self rowSize.
	1 to: self rowSize do: [ :index | array at: index put: (self rowAt: index) ].
	^array
]

{ #category : #accessing }
FUMatrix >> size [

	^self rowSize * self columnSize
]

{ #category : #accessing }
FUMatrix >> sparseSize [

	| tally |
	tally := 0.
	self do: [ :each | each isZero ifTrue: [ tally := tally + 1 ]].
	^tally
]

{ #category : #private }
FUMatrix >> species [

	^self class
]

{ #category : #printing }
FUMatrix >> storeDenseTextOn: aStream [ 
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."

	aStream
		print: self rowSize;
		space; 
		print: self columnSize;
		cr.
	1 to: self rowSize do: [ :row |
		(1 to: self columnSize) 
			do: [ :column | aStream print: (self at: row and: column) ] 
			separatedBy: [ aStream space ].
		aStream cr.
	].
]

{ #category : #printing }
FUMatrix >> storeSparseBinaryOn: aBinaryStream [ 
	" No senders found "
	" self needsWork "

"	| stream |
	stream := NetworkByteOrderStream wrap: aBinaryStream.
	stream
		nextLongPut: self rowSize;
		nextLongPut:  self columnSize;
		nextLongPut:  self sparseSize.
	self columns do: [ :column |
		stream nextLongPut: column sparseSize.
		column doSparseWithIndex: [ :value :index |
			stream nextLongPut: index - 1; nextFloatPut: value.
		].
	]."
]

{ #category : #printing }
FUMatrix >> storeSparseTextOn: aStream [ 
	"Append to the argument aStream a sequence of characters 
	that identifies the collection."

	aStream
		print: self rowSize;
		space; 
		print: self columnSize;
		space;
		print: self sparseSize;
		cr.
	self columns do: [ :column |
		aStream print: column sparseSize; cr.
		column doSparseWithIndex: [ :value :index |
			aStream print: index - 1; space; print: value; cr.
		].
	].
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromDouble: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromFixedPoint: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromFloat: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromFraction: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromInteger: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromMatrix: aMatrix [

	^aMatrix with: self collect: [ :a :b | a + b ]
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromNumber: aNumber [

	^self collect: [ :b | aNumber + b ]
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromPoint: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'double dispatching' }
FUMatrix >> sumFromSmallDouble: aNumber [

	^self sumFromNumber: aNumber
]

{ #category : #'matrix functions' }
FUMatrix >> transposed [

	^MatrixView transposeOn: self
]

{ #category : #private }
FUMatrix >> vectorSpecies [

	^self class vectorSpecies
]

{ #category : #enumerating }
FUMatrix >> with: aMatrix affect: eachOtherBlock [

	[ aMatrix hasDimension: self dimension ] assert.
	self putWithIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].
]

{ #category : #enumerating }
FUMatrix >> with: aMatrix collect: eachOtherBlock [

	| newMatrix |
	[ aMatrix hasDimension: self dimension ] assert.
	newMatrix := self copyEmpty: self dimension.
	newMatrix putWithIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].
	^newMatrix
]

{ #category : #enumerating }
FUMatrix >> with: aMatrix do: eachOtherBlock [

	[ aMatrix hasDimension: self dimension ] assert.
	self withIndices: [ :row :column |
		eachOtherBlock value: (self at: row and: column) value: (aMatrix at: row and: column)
	].
]

{ #category : #enumerating }
FUMatrix >> withIndices: aBlock [

	1 to: self rowSize do: [ :row |
		1 to: self columnSize do: [ :column |
			aBlock value: row value: column
		]
	]
]
