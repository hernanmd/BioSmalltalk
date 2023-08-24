Class {
	#name : #BioQBlastReader,
	#superclass : #BioReader,
	#instVars : [
		'statusParser',
		'rtoe',
		'ridParser',
		'rtoeParser'
	],
	#category : #'BioBlast-Remote'
}

{ #category : #'accessing-get' }
BioQBlastReader >> debugReadyStatus [
	" Private - Log debug status information "
	
	(self gtDebug and: [ self results isNil not ])
		ifTrue: [
			self bioLog: (self results first: 20).
			self bioLog: 'Status ' , self status.
			self 
				dumpToFileNamed: 'parcial' , BioNamedObject uniqueName , '.html'  
				contents: self results ].
]

{ #category : #'accessing-put' }
BioQBlastReader >> delaySeconds [
	" Private - Answer the number of seconds to wait
	for checking again the availability of job results "
	
	^ rtoe asNumber
]

{ #category : #'accessing private' }
BioQBlastReader >> gtDebug [
	" Answer <true> if we want to log debug information to the Transcript (default) or
	other configured stream "
	
	^ false
]

{ #category : #'accessing-get' }
BioQBlastReader >> isValid [
	" Answer <true> if receiver's remote response is valid for reading
	i.e. not UNKNOWN "

	( ( self results beginsWith: '<?xml' ) or: [ self results beginsWith: 'Seq-annot' ] )
			ifFalse: [ 
				| resultType |
				resultType := self statusParser results.
				self bioLog: 'Result Type: ' , resultType.
				^ resultType ~= 'UNKNOWN' ].
	^ true
]

{ #category : #'accessing parser' }
BioQBlastReader >> parserClass [
	" Private - See superimplementor's comment "
	
	^ BioQBlastParser
]

{ #category : #'accessing-put' }
BioQBlastReader >> parserForErrorMsg [
	" Private - This is for NCBI error messages encoded in the partial results responses. Examples 
	 Message ID#24 Error: Failed to read the Blast query: Nucleotide FASTA provided for protein sequence 
	 Message ID#24 Error: Failed to read the Blast query: Gi/accession mismatch: requested nucleotide, found protein	 "
		
	^ ( 'Message ID#' asPParser negate plus , 'Message ID#' asPParser ) ,
		( PPPredicateObjectParser anyExceptAnyOf: '</p>' ) plus flatten foldRight: [: a : b | b ]

]

{ #category : #'accessing-put' }
BioQBlastReader >> parserForQBlastInfoBegin [ 

	^ self parserClass new parserForQBlastInfoBegin 
]

{ #category : #'accessing-put' }
BioQBlastReader >> parserForRID [

	^ ridParser 
		ifNil: [ ridParser := self parserClass new parserForRID ]
]

{ #category : #'accessing-put' }
BioQBlastReader >> parserForRTOE [

	^ rtoeParser 
		ifNil: [ rtoeParser := self parserClass new parserForRTOE ]
]

{ #category : #'accessing-put' }
BioQBlastReader >> rid [
	" Answer a String with the Request Identifier "
	
	| requestIdentifier |

	requestIdentifier := self parserForRID parse: self results.
	^ ( requestIdentifier beginsWith: 'Error' )
		ifTrue: [ self error: 'Couldn''t parse request identifier ', ( self parserForErrorMsg parse: self results ) ]
		ifFalse: [ requestIdentifier ]

]

{ #category : #'accessing-put' }
BioQBlastReader >> rtoe [
	"Answer a <String> with the Request Time of Execution in seconds"
	
	| lastRtoe |
	
	self bioLog: 'Parsing RTOE...'.
	lastRtoe := self parserForRTOE parse: self results.
	^ (lastRtoe beginsWith: 'Error')
		ifFalse: [ 
			self bioLog: 'New RTOE = ' , lastRtoe.
			rtoe := lastRtoe ]
		ifTrue: [ 
			self bioLog: 'RTOE not found: ' , lastRtoe.
			rtoe 
				ifNil: [ self error: 'Couldn''t parse Request Time of Execution' ]
				ifNotNil: [ rtoe ] ] " Using the last known RTOE... "
]

{ #category : #'accessing-get' }
BioQBlastReader >> selectStatus [
	"Private - Wait for the results until ready, answer <true> if results sent are ready and valid"
	
	| waiting |

	self shouldWaitForResults
		ifTrue: [ 
			waiting := self delaySeconds + 100.
			self bioLog: 'QBLAST: Delaying retry for ' , waiting asString , ' seconds'.
			(Delay forSeconds: waiting) wait.
			^  false ].
	^ true


]

{ #category : #'accessing-get' }
BioQBlastReader >> shouldWaitForResults [
	" Private - Answer <true> if results contains status information "
	
	^ (self statusParser parser matches: self results) 
			or: [ self parserForQBlastInfoBegin matches: self results ]



]

{ #category : #'accessing-get' }
BioQBlastReader >> status [
	"Answer a <String> with the result of the remote job"
	
	^ self statusParser parse: self results
]

{ #category : #'accessing-get' }
BioQBlastReader >> statusParser [

	^ statusParser 
		ifNil: [ statusParser := self parserClass new parserForStatus ]
]
