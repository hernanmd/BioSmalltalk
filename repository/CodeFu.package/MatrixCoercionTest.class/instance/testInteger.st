test
testInteger

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 2.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.