accessing-get
shouldWaitForResults
	" Private - Answer <true> if results contains status information "
	
	^ ( self statusParser parser matches: self results ) 
			or: [ self parserForQBlastInfoBegin matches: self results ]


