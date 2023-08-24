Class {
	#name : #BioQBlastParser,
	#superclass : #BioAbstractTextParser,
	#category : #'BioParsers-Core'
}

{ #category : #'initialize-release' }
BioQBlastParser >> parserForQBlastInfoBegin [

	^ 'QBlastInfoBegin' asPParser negate plus , 'QBlastInfoBegin' asPParser
]

{ #category : #'initialize-release' }
BioQBlastParser >> parserForRID [
	" Private - Answer a parser for the request time identiferi inside a NCBI WWW QBlast job request page
<!--QBlastInfoBegin
    RID = HZ50WJZT01N
    RTOE = 10
QBlastInfoEnd
--> "	
	parser := ( 
		self parserForQBlastInfoBegin ,
		 #newline asPParser ,
		'RID' asPParser negate plus , 'RID' asPParser ,		
		#blank asPParser optional , ($= asPParser / $: asPParser) , #blank asPParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asPParser negate plus , 'QBlastInfoEnd' asPParser ) foldRight: [: a :b | a ].
]

{ #category : #'initialize-release' }
BioQBlastParser >> parserForRTOE [
	" Private - Answer a parser for request time of execution inside a NCBI WWW QBlast job request page
<!--QBlastInfoBegin
    RID = HZ50WJZT01N
    RTOE = 10
QBlastInfoEnd
--> "	
	parser := ( 
		'QBlastInfoBegin' asPParser negate plus , 'QBlastInfoBegin' asPParser ,
		 #newline asPParser ,
		'RTOE' asPParser negate plus , 'RTOE' asPParser ,		
		#blank asPParser optional , ( $= asPParser / $: asPParser ) , #blank asPParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asPParser negate plus , 'QBlastInfoEnd' asPParser ) foldRight: [: a :b | a ].
]

{ #category : #'initialize-release' }
BioQBlastParser >> parserForStatus [
	" See http://www.ncbi.nlm.nih.gov/BLAST/Doc/node60.html "
	
	parser := ( 
		'QBlastInfoBegin' asPParser negate plus , 'QBlastInfoBegin' asPParser ,
		 #newline asPParser , 
		'Status=' asPParser negate plus , 'Status=' asPParser ,
		( 'READY' asPParser / 'WAITING' asPParser / 'UNKNOWN' asPParser ) ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asPParser negate plus , 'QBlastInfoEnd' asPParser ) foldRight: [: a :b | a ].
]
