exporting
exportFromBLAST: hitCollection
	" Write two files: 
	1) A time-stamped file in the receiver's format from hitCollecction
	2) A CSV file linking the receiver's RFLP and STR names with the HIT description information from the BLAST "

	| columns |

	columns := self fillDataColumnsFrom: hitCollection.
	self needsWork.	" Adapt to take positions specified by user "
	positionCiphers := columns last numberOfDigits.
	self initMatrixRows: hitCollection size + positionCiphers + 1
		columns: columns size + 3.	" 2 spaces + 1 character for the frequency column"
	self fillHeaderColumns: columns.
	self fillMatrixFrom: hitCollection columns: columns.
	self fillFrequenciesColumn.
	self exportMatrix.
	self exportWeights.
	self outputFile close.
	self exportIdentifiers: hitCollection.	