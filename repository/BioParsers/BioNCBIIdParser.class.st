Class {
	#name : #BioNCBIIdParser,
	#superclass : #BioNCBIAbstractParser,
	#category : #'BioParsers-Core'
}

{ #category : #accessing }
BioNCBIIdParser class >> allIdentifiers [
	" Answer a <Collection> "

	^ ((self allFinalClasses collect: #identifier) 
		select: #isString)
		collect: [: id | (id endsWith: '|') 
			ifTrue: [ id allButLast ] 
			ifFalse: [ id ] ]
]

{ #category : #accessing }
BioNCBIIdParser class >> classFor: aString [
	" Answer a class which identifies aString "
	
	^ self withAllSubclasses 
		detect: [ : cls | cls identifier = aString ]
		ifNone: [ nil ]
		
]

{ #category : #accessing }
BioNCBIIdParser class >> identifier [
	" Answer a class appropiate for parsing a specified NCBI identifier String "
	
	^ ( ( 'gb' asParser / 'emb' asParser / 'dbj' asParser / 'pir' asParser / 'prf' asParser / 
		  'sp' asParser / 'pdb' asParser / 'pat' asParser / 'bbs' asParser / 'gnl' asParser / 
		  'ref' asParser / 'lcl' asParser ) ==> [: token | self classFor: token value ] ) end 
		
]

{ #category : #accessing }
BioNCBIIdParser >> identifier [
	" Answer the identifying String of the receiver "
	
	^ self class identifier
]

{ #category : #'initialize-release' }
BioNCBIIdParser >> initialize [
	" Private - See superimplementor's comment "
	
	parser := self parserForIdentifier , #number asParser
]

{ #category : #'initialize-release' }
BioNCBIIdParser >> localIdParser [

	^ self parserForNonFastaString
]
