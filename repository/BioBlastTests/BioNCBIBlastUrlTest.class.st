Class {
	#name : #BioNCBIBlastUrlTest,
	#superclass : #BioNCBITests,
	#category : 'BioBlastTests-Core'
}

{ #category : #accessing }
BioNCBIBlastUrlTest >> baseUrl [

	^ BioNCBIWebBlastWrapper baseUrl
]

{ #category : #testing }
BioNCBIBlastUrlTest >> testCompleteGetUrl [

	| url |
	
	url := BioNCBIUrl2 fromString: self baseUrl.
	url queryAt: 'CMD' put: 'Get'.
	url queryAt: 'RID' put: '954517013-7638-11119'.
	
	self assert: (BioWebClientEngine decode: url asString) =  
		'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Get&RID=954517013-7638-11119'
]

{ #category : #testing }
BioNCBIBlastUrlTest >> testCompletePutUrl [

	| url |
	
	url := BioNCBIUrl2 fromString: self baseUrl.
	url 
		queryAt: 'CMD' put: 'Put';
		queryAt: 'DATABASE' put: 'nr';
		queryAt: 'QUERY' put: 555;
		queryAt: 'HITLIST_SIZE' put: 10;
		queryAt: 'FILTER' put: 'L';
		queryAt: 'EXPECT' put: 10;
		queryAt: 'PROGRAM' put: 'blastn';
		queryAt: 'SERVICE' put: 'plain'.
	
	self assert: (BioWebClientEngine decode: url asString) =  
		'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&SERVICE=plain&PROGRAM=blastn&FILTER=L&QUERY=555&DATABASE=nr&HITLIST_SIZE=10&EXPECT=10'
]
