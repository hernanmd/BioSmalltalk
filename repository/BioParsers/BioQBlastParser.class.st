Class {
	#name : #BioQBlastParser,
	#superclass : #BioAbstractTextParser,
	#category : 'BioParsers-Core'
}

{ #category : #'initialize-release' }
BioQBlastParser >> parserForQBlastInfoBegin [

	^ 'QBlastInfoBegin' asParser negate plus , 'QBlastInfoBegin' asParser
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
		 #newline asParser ,
		'RID' asParser negate plus , 'RID' asParser ,		
		#blank asParser optional , ( $= asParser / $: asParser ) , #blank asParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].
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
		'QBlastInfoBegin' asParser negate plus , 'QBlastInfoBegin' asParser ,
		 #newline asParser ,
		'RTOE' asParser negate plus , 'RTOE' asParser ,		
		#blank asParser optional , ( $= asParser / $: asParser ) , #blank asParser optional ,
		self parserForNonBreakingString ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].
]

{ #category : #'initialize-release' }
BioQBlastParser >> parserForStatus [
	" See http://www.ncbi.nlm.nih.gov/BLAST/Doc/node60.html "
	
	parser := ( 
		'QBlastInfoBegin' asParser negate plus , 'QBlastInfoBegin' asParser ,
		 #newline asParser , 
		'Status=' asParser negate plus , 'Status=' asParser ,
		( 'READY' asParser / 'WAITING' asParser / 'UNKNOWN' asParser ) ==> [: nodes | nodes last ] ,
		'QBlastInfoEnd' asParser negate plus , 'QBlastInfoEnd' asParser ) foldRight: [: a :b | a ].
]
