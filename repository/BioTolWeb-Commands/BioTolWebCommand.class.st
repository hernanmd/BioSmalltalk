"
This is a helper class and should not be used directly. Use the BioTolWebClient instead.

"
Class {
	#name : #BioTolWebCommand,
	#superclass : #BioCommandObject,
	#category : 'BioTolWeb-Commands'
}

{ #category : #accessing }
BioTolWebCommand class >> baseUrl [
	" Private - See superimplementor's comment "
	
	^ self subclassResponsibility 
]

{ #category : #accessing }
BioTolWebCommand >> baseUrl [

	^ self class baseUrl
]

{ #category : #accessing }
BioTolWebCommand >> execute [
	"Execute the receiving action. Answer a BioInitialResult "

	^ self client execute

]

{ #category : #initialize }
BioTolWebCommand >> initialize [
	" Private - Configure the receiver's URL object with the receiver's service name "

	self url: (BioWebClientEngine urlFromString: (self url asString , self baseUrl))

]

{ #category : #accessing }
BioTolWebCommand >> url [
	" Access the client url object "

	^ self client url
]

{ #category : #accessing }
BioTolWebCommand >> url: anUrl [
	" Set the client url object "

	^ self client url: anUrl
]
