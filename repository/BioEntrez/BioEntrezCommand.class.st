"
Abstract superclass for all Entrez commands.

http://www.ncbi.nlm.nih.gov/entrez/query/static/eutils_help.html
"
Class {
	#name : #BioEntrezCommand,
	#superclass : #BioCommandObject,
	#category : 'BioEntrez-Commands'
}

{ #category : #testing }
BioEntrezCommand class >> validParameters [
	" Answer <true> if the receiver supports client parameters "
	
	^ #( 'tool' 'email' )
]

{ #category : #'accessing private' }
BioEntrezCommand >> baseUrl [
	" Private - See class side "
	
	^ self class baseUrl 
]

{ #category : #testing }
BioEntrezCommand >> checkParameters [
	" Answer <true> if the receiver supports client parameters "
	
	^ self client parameters allSatisfy: [ : par |
		self validParameters includes: par ]
]

{ #category : #'accessing private' }
BioEntrezCommand >> execute [
	" Execute the receiving action. Answer a BioESearchResult "

	^ self checkParameters
		ifTrue: [ 
			self client 
				cmdName: self baseUrl;
				execute ]
		ifFalse: [ self signalInvalidObject: 'Invalid or insufficient parameters' translated ]

]

{ #category : #testing }
BioEntrezCommand >> validParameters [
	" Answer <true> if the receiver supports client parameters "
	
	^ self class validParameters
]
