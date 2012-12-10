weighting
weight

	| newMatrix |
	newMatrix := SparseRowMatrix new: matrix dimension.
	matrix rows with: newMatrix rows do: [ :row :newRow |
		| globalWeight  |
		globalWeight := globalWeighting forTerm: row.
		row doSparseWithIndex: [ :each :index |
			newRow at: index put: (localWeighting forValue: each) * globalWeight ]].
	matrix := newMatrix.