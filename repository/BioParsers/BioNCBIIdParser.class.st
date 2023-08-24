Class {
	#name : #BioNCBIIdParser,
	#superclass : #BioIDParser,
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
	
	^ ( ( 'gb' asPParser / 'emb' asPParser / 'dbj' asPParser / 'pir' asPParser / 'prf' asPParser / 
		  'sp' asPParser / 'pdb' asPParser / 'pat' asPParser / 'bbs' asPParser / 'gnl' asPParser / 
		  'ref' asPParser / 'lcl' asPParser ) ==> [: token | self classFor: token value ] ) end 
		
]

{ #category : #accessing }
BioNCBIIdParser >> identifier [
	" Answer the identifying String of the receiver "
	
	^ self class identifier
]

{ #category : #initialization }
BioNCBIIdParser >> initialize [
	" Private - See superimplementor's comment "
	
	parser := self parserForIdentifier , #number asPParser
]

{ #category : #'initialize-release' }
BioNCBIIdParser >> localIdParser [

	^ self parserForNonFastaString
]
