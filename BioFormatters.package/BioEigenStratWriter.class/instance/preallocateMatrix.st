private
preallocateMatrix
	| rows |
	
	rows := 0.
	self parser rowsWhere: [ : row | row isEmpty not and: [ row first first isLetter not ] ] do: [ : row | rows := rows + 1 ].
	self initMatrixRows: rows columns: 6.	