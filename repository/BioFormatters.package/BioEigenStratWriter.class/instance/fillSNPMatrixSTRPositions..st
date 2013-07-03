private
fillSNPMatrixSTRPositions: currentStrname

	| zeroPad gPos gPosCm repetitions |

	currentStrname = strName
		ifFalse: [ fCounter := fCounter + 1.
				strName := currentStrname ].
	repetitions := 5 - matrix numberOfRows digitCount.
	zeroPad := BioObject generateJoin: 0 repeat: repetitions.
	gPos := zeroPad , gPosCounter asString , zeroPad , fCounter asString.
	gPosCm := '0.' , gPos.
	rowIndex := rowIndex + 1.
	self matrix 
		at: rowIndex at: 2 put: $1;									" Columna 2: pone 1 "
		at: rowIndex at: 3 put: gPosCm ;							" Columna 3: Escribir 0.NNN "
		at: rowIndex at: 4 put: gPos;		" Columna 4"
		at: rowIndex at: 5 put: $1;									" Columna 5 "
		at: rowIndex at: 6 put: $2.
	gPosCounter := gPosCounter + 1.