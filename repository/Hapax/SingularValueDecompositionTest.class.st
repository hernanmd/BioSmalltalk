Class {
	#name : #SingularValueDecompositionTest,
	#superclass : #TestCase,
	#category : 'Hapax'
}

{ #category : #running }
SingularValueDecompositionTest >> testDecomposition [

	|  tdm |
	tdm := TermDocumentMatrixTest new testFinalDeer90.
	tdm decomposition.
]
