private
preallocateMatrix
	| rows |
	
	rows := 0.
	self parser 
		select: [ : row | row notEmpty and: [ self includesAlleleFrq: row ] ]
		thenDo: [ : row | rows := rows + 1 ].
	self initMatrixRows: rows columns: 6.	