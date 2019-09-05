Class {
	#name : #SingularValueDecomposition,
	#superclass : #Object,
	#instVars : [
		'V',
		'U',
		'S',
		'comment'
	],
	#category : 'Hapax'
}

{ #category : #'instance creation' }
SingularValueDecomposition class >> on: aMatrix [ 

	^self on: aMatrix with: 0
]

{ #category : #'instance creation' }
SingularValueDecomposition class >> on: matrix with: dimensions [

	^SVDProcess applyOn: matrix with: dimensions
]

{ #category : #'instance creation' }
SingularValueDecomposition class >> withS: aVector withU: leftMatrix withV: rightMatrix [

	^self new
		setS: aVector setU: leftMatrix setV: rightMatrix;
		yourself.
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> S [

	^DiagonalMatrix withDiagonal: self s
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> S: rank [

	^DiagonalMatrix withDiagonal: (self s: rank)
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> U [

	^U
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> U: rank [

	^MatrixView fromColumn: 1 to: rank on: self U.
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> V [

	^V
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> V: rank [

	^MatrixView fromColumn: 1 to: rank on: self V.
]

{ #category : #accessing }
SingularValueDecomposition >> at: anIndex [

	^self s at: anIndex
]

{ #category : #accessing }
SingularValueDecomposition >> comment [

	^comment ifNil: [ '<nil>' ]
]

{ #category : #accessing }
SingularValueDecomposition >> comment: aString [

	^comment := aString
]

{ #category : #arithmetic }
SingularValueDecomposition >> compose [
	"comment stating purpose of message"

	^self U *~ self S *~ self V transposed
]

{ #category : #arithmetic }
SingularValueDecomposition >> compose: rank [

	^(self U: rank) *~ (self S: rank) *~ (self V: rank) transposed
]

{ #category : #accessing }
SingularValueDecomposition >> dimension [

	^self m @ self n
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> k [

	^self s size
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> m [

	^self U rowSize
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> n [

	^self V rowSize
]

{ #category : #accessing }
SingularValueDecomposition >> rank [
	"Dummy method template.  This was installed by the debugger
	define method command."

	^S size
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> s [

	^S
]

{ #category : #'accessing mathematical' }
SingularValueDecomposition >> s: rank [

	^self s copyFrom: 1 to: rank
]

{ #category : #'initialize-release' }
SingularValueDecomposition >> setS: aVector setU: leftMatrix setV: rightMatrix [

	S := aVector.
	U := leftMatrix.
	V := rightMatrix.
	[ S size = U columnSize ] assert.
	[ S size = V columnSize ] assert.
]

{ #category : #accessing }
SingularValueDecomposition >> size [

	^self k
]
