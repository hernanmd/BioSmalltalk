initialize-release
parserForRID
	" Private - Answer a parser for the request time identiferi inside a NCBI WWW QBlast job request page
<!--QBlastInfoBegin
    RID = HZ50WJZT01N
    RTOE = 10
QBlastInfoEnd
--> "	
	parser := ( 
		self parserForQBlastInfoBegin ,
		 #newline asParser ,
		'RID' asParser negate plus , 'RID' asParser ,		
		#blank asParser optional , ( $= asParser / $: asParser ) , #blank asParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].