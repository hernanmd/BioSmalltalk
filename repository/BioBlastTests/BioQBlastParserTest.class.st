Class {
	#name : #BioQBlastParserTest,
	#superclass : #BioAbstractParserTest,
	#category : 'BioBlastTests-Core'
}

{ #category : #accessing }
BioQBlastParserTest >> parserForRID [

	^ self parser parserForRID
]

{ #category : #accessing }
BioQBlastParserTest >> parserForRTOE [

	^ self parser parserForRTOE
]

{ #category : #accessing }
BioQBlastParserTest >> setUp [

	super setUp.
	parser := BioQBlastParser new
]

{ #category : #accessing }
BioQBlastParserTest >> statusParser [

	^ self parser parserForStatus 
]

{ #category : #testing }
BioQBlastParserTest >> test01BasicRequest [

	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID=1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID = 1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID:1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
	self assert: ( self parserForRID parse: '<p><!--QBlastInfoBegin
	RID : 1038164033-015457-19065
QBlastInfoEnd' ) = '1038164033-015457-19065'.
]

{ #category : #testing }
BioQBlastParserTest >> test01BasicStatus [

	self assert: ( self statusParser parse: '<p><!--QBlastInfoBegin
	Status=READY
QBlastInfoEnd' ) = 'READY'.
]

{ #category : #testing }
BioQBlastParserTest >> test01CompleteRequest [

	self assert: ( self parserForRID parse: BioWebBlastSamples new qbreq1Html ) = 'HZ50WJZT01N'.
	self assert: ( self parserForRTOE parse: BioWebBlastSamples new qbreq1Html ) = '10'	
]

{ #category : #testing }
BioQBlastParserTest >> test01CompleteStatus [

	self assert: ( self statusParser parse: BioWebBlastSamples new bt064Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt061Txt ) = 'READY'.	
	self assert: ( self statusParser parse: BioWebBlastSamples new bt066Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt072Txt ) = 'READY'.		
	self assert: ( self statusParser parse: BioWebBlastSamples new bt073Txt ) = 'READY'.
	self assert: ( self statusParser parse: BioWebBlastSamples new bt074Txt ) = 'READY'.			
]

{ #category : #testing }
BioQBlastParserTest >> test02BasicStatus [

	self assert: ( self statusParser parse: '<p><!--QBlastInfoBegin
	Status=WAITING
QBlastInfoEnd' ) = 'WAITING'.
]

{ #category : #testing }
BioQBlastParserTest >> test02CompleteStatus [

	self assert: ( self statusParser parse: BioWebBlastSamples new blastcgiHtm ) = 'WAITING'.
	self assert: ( self statusParser parse: '


<p><!--QBlastInfoBegin
	Status=WAITING
QBlastInfoEnd
fafda0fdaf

afda+uf9dafdas' ) = 'WAITING'.	
]
