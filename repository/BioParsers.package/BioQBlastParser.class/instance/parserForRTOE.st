initialize-release
parserForRTOE
	" Private - Answer a parser for request time of execution inside a NCBI WWW QBlast job request page
<!--QBlastInfoBegin
    RID = HZ50WJZT01N
    RTOE = 10
QBlastInfoEnd
--> "	
	parser := ( 
		'QBlastInfoBegin' asParser negate plus , 'QBlastInfoBegin' asParser ,
		 #newline asParser ,
		'RTOE' asParser negate plus , 'RTOE' asParser ,		
		#blank asParser optional , ( $= asParser / $: asParser ) , #blank asParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].