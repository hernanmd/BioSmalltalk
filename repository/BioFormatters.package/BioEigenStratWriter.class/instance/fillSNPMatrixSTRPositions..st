private
fillSNPMatrixSTRPositions: currentStrname

	| gPos |
	" If breed has changed, increment breed counter "
	(currentStrname allButLast: 3) = strName
		ifFalse: [ fCounter := fCounter + 1.
				strName := (currentStrname allButLast: 3) ].
	gPos := (fCounter printPaddedWith: $0 to: 2) , (rowIndex printPaddedWith: $0 to: 3).
	rowIndex := rowIndex + 1.	
	self fillSNPMatrixPosition: gPos.
