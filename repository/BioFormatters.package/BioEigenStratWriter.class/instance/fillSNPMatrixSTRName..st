private
fillSNPMatrixSTRName: row

	(row isEmpty not and: [ row first first isLetter ])
		ifTrue: [ self strName: row first , ':' ]
		ifFalse: [ 
			self matrix at: rowIndex at: 1 put: self strName , row first.
			rowIndex := rowIndex + 1 ]
