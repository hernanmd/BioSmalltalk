private
decompose

	U := RowMatrix withAll: A.
	m := A rowSize.
	n := A columnSize.
	V := RowMatrix new: n@n.
	S := ArrayVector new: n.

	self performDecomposition	.
	self sort.

	A := nil.