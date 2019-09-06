Extension { #name : #Object }

{ #category : #'*BioTools' }
Object class >> allowOpenTranscript [
	" Answer <true> if receiver is allowd to open a Transcript window to report log "

	^ false
]

{ #category : #'*BioTools' }
Object >> allowOpenTranscript [
	" See comment in class side "

	^ self class allowOpenTranscript
]

{ #category : #'*BioTools' }
Object >> bioLog: aString [
	" Write aString to a streamer "
	
	^ self class bioLog: aString
]

{ #category : #'*BioTools' }
Object class >> bioLog: aString [
	" Write aString to the Transcript "
	
	| trWindow |
	trWindow := self openTranscript.
	self streamer cr; 
		show: DateAndTime current printYMDHMS;
		space;
		show: aString.
	^ trWindow
]

{ #category : #'*BioTools' }
Object >> bioLog: aString event: aDescriptionString [
	" Write aString and aDescriptionString to a streamer "
	
	self class bioLog: aString event: aDescriptionString
]

{ #category : #'*BioTools' }
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

{ #category : #'*BioTools' }
Object >> bioReader [
	" Answer a BioReader on the receiver "
	
	^ self
]

{ #category : #'*BioTools' }
Object >> closeTranscript [
	" See comment in class side "
	
	^ self class closeTranscript
]

{ #category : #'*BioTools' }
Object class >> closeTranscript [
	" Private - Close the system Transcript if opened "

	Transcript close
]

{ #category : #'*BioTools' }
Object >> isBiologicalSequence [
	" Answer <true> if the receiver represents an identifiable biological letter "
	
	^ false
]

{ #category : #'*BioTools' }
Object >> isDNASequence [
	" Answer <true> if the receiver represents an identifiable biological sequence "
	
	^ false
]

{ #category : #'*BioTools' }
Object >> isProteinSequence [
	" Answer <true> if the receiver represents an identifiable biological sequence "
	
	^ false
]

{ #category : #'*BioTools' }
Object >> isRNASequence [
	" Answer <true> if the receiver represents an identifiable biological sequence "
	
	^ false
]

{ #category : #'*BioTools' }
Object >> isXML [
	" Answer <true> if the receiver's contents *looks like* XML "

	^ false
]

{ #category : #'*BioTools' }
Object class >> openTranscript [
	" Private - Open the system Transcript if closed "

	^ self allowOpenTranscript
		ifTrue: [ Transcript open ].
]

{ #category : #'*BioTools' }
Object >> openTranscript [

	self class openTranscript
]

{ #category : #'*BioTools' }
Object class >> signalDuplicateObject: errorString [
	" See comment in BioDuplicatedObject "
	
	^ BioDuplicatedObject new signal: errorString
]

{ #category : #'*BioTools' }
Object >> signalDuplicateObject: errorString [
	" Raise an exception with errorString as description. This message should be sent when a duplicate is found in any context "
	
	^ self class signalDuplicateObject: errorString
]

{ #category : #'*BioTools' }
Object class >> signalInvalidObject: errorString [
	" Raise an exception with errorString as description. This message should be sent when general unexpected or unwanted behavoir is found. For example :
	- Empty results
	- Invalid parameters
	- Limits were reached
	" 
	^ BioErrorSpecificationObject new signal: errorString
]

{ #category : #'*BioTools' }
Object >> signalInvalidObject: errorString [
	" Raise an exception with errorString as description. This message should be sent when general unexpected or unwanted behavoir is found. For example :
	- Empty results
	- Invalid parameters
	- Limits were reached
	" 
	
	^ self class signalInvalidObject: errorString
]

{ #category : #'*BioTools' }
Object >> signalNotFound: errorString [
	" Raise an exception with errorString as description. This message should be sent when a requested resource is not available "

	^ self class signalNotFound: errorString
]

{ #category : #'*BioTools' }
Object class >> signalNotFound: errorString [
	" Raise an exception with errorString as description. This message should be sent when a requested resource is not available "

	^ BioNotFoundObject new signal: errorString
]

{ #category : #'*BioTools' }
Object >> streamer [
	" Answer a Stream. Specialize if necessary "
	
	^ self class streamer
]

{ #category : #'*BioTools' }
Object class >> streamer [
	" Answer a default streamer for logging the receiver "
	
	^ Transcript

]
