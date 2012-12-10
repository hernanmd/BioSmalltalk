matrix functions
*~ aMatrix
	"Answer the matrix multiplication of the reciever with the argument."

	| newMatrix |
	self columnSize = aMatrix rowSize ifFalse: [ Array new noMatchError ].
	newMatrix := self species rows: self rowSize columns: aMatrix columnSize.
	"workaround: this should be done in a more generic way with double dispatch."
	newMatrix putWithIndices: ((aMatrix isKindOf: DiagonalMatrix) 
		ifTrue: [ [ :i :j | (self at: i and: j ) * (aMatrix at: j and: j) ] ]
		ifFalse: [ [ :i :j | (1 to: self columnSize) inject: 0 into: [ :sum :k | sum + ((self at: i and: k) * (aMatrix at: k and: j)) ] ] ]).
	^newMatrix