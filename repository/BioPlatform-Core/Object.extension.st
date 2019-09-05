Extension { #name : #Object }

{ #category : #'*bioplatform' }
Object class >> allowOpenTranscript [

	^ false
]

{ #category : #'*bioplatform' }
Object class >> bioLog: aString [
	" Write aString to the Transcript "
	
	self openTranscript.
	self streamer cr; 
		show: DateAndTime current;
		space;
		show: aString.
]

{ #category : #'*bioplatform' }
Object class >> bioLog: aString event: aDescriptionString [
	" Write aString to the streamer "
	
	self openTranscript.
	self streamer cr; 
		show: DateAndTime current;
		space;
		show: aString;
		tab;
		show: aDescriptionString
]

{ #category : #'*bioplatform' }
Object class >> openTranscript [
	" Private - Open the system Transcript if closed "

	(self allowOpenTranscript and: [ Transcript dependents isEmpty ])
		ifTrue: [ Transcript open ].
]

{ #category : #'*bioplatform' }
Object class >> shouldLog [
	" By default do not log conditional logs "
	
	^ false
]

{ #category : #'*bioplatform' }
Object class >> streamer [
	" Answer a default streamer for logging the receiver "
	
	^ Transcript

]
