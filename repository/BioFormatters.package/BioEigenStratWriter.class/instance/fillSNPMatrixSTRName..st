private
fillSNPMatrixSTRName: row
	" Private - Append separator between SNP or Microsatellite name and allele number at current row "
	
	(row allSatisfy: #isNil) not
		ifFalse: [ ^ self ].
	(row notEmpty and: [ self isLocusName: row ])
		ifTrue: [ self strName: row first , ':' ]
		ifFalse: [ 
			self matrix at: rowIndex at: 1 put: self strName , row first.
			rowIndex := rowIndex + 1 ]
