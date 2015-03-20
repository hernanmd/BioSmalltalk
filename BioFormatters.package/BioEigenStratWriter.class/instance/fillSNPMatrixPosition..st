private
fillSNPMatrixPosition: gPos
	" Private - Write SNP matrix current row with gPos values "

	self matrix 
		at: rowIndex at: 2 put: $1;	
		at: rowIndex at: 3 put: '0.' , gPos;
		at: rowIndex at: 4 put: gPos;
		at: rowIndex at: 5 put: $1;
		at: rowIndex at: 6 put: $2.