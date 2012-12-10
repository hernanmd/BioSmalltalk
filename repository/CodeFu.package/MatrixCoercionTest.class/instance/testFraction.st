test
testFraction

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 1/2.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.