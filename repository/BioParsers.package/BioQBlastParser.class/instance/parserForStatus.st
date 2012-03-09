initialize-release
parserForStatus
	" See http://www.ncbi.nlm.nih.gov/BLAST/Doc/node60.html "
	
	parser := ( 
		'QBlastInfoBegin' asParser negate plus , 'QBlastInfoBegin' asParser ,
		 #newline asParser , 
		'Status=' asParser negate plus , 'Status=' asParser ,
		( 'READY' asParser / 'WAITING' asParser / 'UNKNOWN' asParser ) ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].