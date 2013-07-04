private
fillSNPMatrixPosition: gPos

	self matrix 
		at: rowIndex at: 2 put: $1;				" Columna 2: pone 1 "
		at: rowIndex at: 3 put: '0.' , gPos;		" Columna 3: Escribir 0.NNN "
		at: rowIndex at: 4 put: gPos;			" Columna 4"
		at: rowIndex at: 5 put: $1;				" Columna 5 "
		at: rowIndex at: 6 put: $2.