private
shouldQuote: aString
	" Answer <true> if aString value should be written between quotes "

	^ #( 
	'SampleName'
	'Title'
	'MatrixData'
	'MissingData'
	'MatrixName'
	'StructureName'	
	'HaplListName' ) includes: aString