running
applyOn: matrix with: dimensions

	| process |
	process := SVDProcess new.
	process matrix: matrix.
	process dimensions: dimensions.
	process apply.
	^process svd