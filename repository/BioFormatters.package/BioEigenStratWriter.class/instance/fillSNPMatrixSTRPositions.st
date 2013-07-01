accessing
fillSNPMatrixSTRPositions

	| strCount |
	strCount := 0.		" Contador para el total de microsatelite + alelos (para XXX) en la 3ra columna : 0.NNNXXX "
	self parser rowsDo: [: row | | strName alleleCount |
		strName := row second.
		1 to:  alleleCount do: [: alelleNum | | zeroPad |
			zeroPad := BioObject generateJoin: 0 repeat: 5 - strCount digitCount.	
			self outputFile 
				nextPutAll: strName;				" Columna 1: Escribir nombre del microsatelite: "
				nextPut: $:;
				nextPutAll: alelleNum asString; tab; 		" Columna 1: Escribir numero del alelo?? y restantes columnas "
				nextPut: $1; tab;				" Columna 2: pone 1 "
				nextPutAll: '0.' , row first asString;		"  Columna 3: Escribir 0.NNN "
				nextPutAll: zeroPad , strCount asString; tab;	" Columna 3: Escribir XXX en 0.NNNXXX "
				nextPutAll: row first asString , zeroPad , strCount asString; tab;		" Columna 4"
				nextPut: $1; tab;				" Columna 5 "
				nextPut: $2; cr.					" Columna 6"
			strCount := strCount + 1 ] ].


