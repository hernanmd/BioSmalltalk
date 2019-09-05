Class {
	#name : #BioNCBICommand,
	#superclass : #BioRemoteCommandObject,
	#category : 'BioNCBI-Commands'
}

{ #category : #accessing }
BioNCBICommand class >> cmdString [
	" Answer the command String for URLs "
	
	^ 'CMD'

]

{ #category : #accessing }
BioNCBICommand >> cmdString [
	" Answer the command String for URLs "
	
	^ self class cmdString

]

{ #category : #'accessing private' }
BioNCBICommand >> execute [
	"Execute the receiving action. Answer a GTSearchResult object "

	^ self checkParameters
		ifTrue: [ self client execute ]
		ifFalse: [ self signalInvalidObject: 'Invalid or insufficient parameters' translated ]
]

{ #category : #accessing }
BioNCBICommand >> fetch [
	" Execute the configured operations and answer the results object "

	^ client execute
]

{ #category : #accessing }
BioNCBICommand >> get [
	" Start issuing receiver's client get parameters "
	
	^ client get
]

{ #category : #testing }
BioNCBICommand >> isGet [
	
	^ false
]

{ #category : #testing }
BioNCBICommand >> isPut [
	
	^ false
]

{ #category : #accessing }
BioNCBICommand >> page: aString [
	" Undocumented? "
	
	client addParameters: 'PAGE=' , aString

]

{ #category : #accessing }
BioNCBICommand >> put [
	" Start issuing receiver's client put parameters "
	
	^ client put
]
