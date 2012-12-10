SVD decomposing
decomposition

	^decomposition ifNil: [ decomposition := SingularValueDecomposition on: matrix with: self expectedRank ]