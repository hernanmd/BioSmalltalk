"
BioException is the superclass of all exceptions related to BioSmalltalk.


"
Class {
	#name : #BioException,
	#superclass : #Exception,
	#instVars : [
		'exceptionDate'
	],
	#classVars : [
		'Logger',
		'RaiseWarning',
		'ShowWarning',
		'UseLogger'
	],
	#category : #'BioTools-Exceptions'
}

{ #category : #accessing }
BioException class >> logger [

	^ Logger
		ifNil: [ Logger := Set new ]
]

{ #category : #accessing }
BioException class >> logger: anObject [
	Logger := anObject
]

{ #category : #accessing }
BioException class >> raiseWarning [

	^ RaiseWarning
		ifNil: [ RaiseWarning := true ]
]

{ #category : #accessing }
BioException class >> raiseWarning: anObject [
	RaiseWarning := anObject
]

{ #category : #'initialize-release' }
BioException class >> release [
	" Private - Do some cleanup.
	
	self release
	"
	
	Logger := nil

]

{ #category : #accessing }
BioException class >> showWarning [

	^ ShowWarning
		ifNil: [ ShowWarning := true ]
]

{ #category : #accessing }
BioException class >> showWarning: anObject [
	ShowWarning := anObject
]

{ #category : #accessing }
BioException class >> useLogger [
	" Logger should be used only for debugging purposes "

	^ UseLogger
		ifNil: [ UseLogger := false ]	
]

{ #category : #accessing }
BioException class >> useLogger: anObject [
	UseLogger := anObject
]

{ #category : #accessing }
BioException >> defaultAction [
	"The default action taken if the exception is signaled."

	self useLogger
		ifTrue: [ self logger add: self ].
	self showWarning 
		ifTrue: [ self bioLog: self messageText ].
	self raiseWarning 
		ifTrue: [ BioObject alert: self messageText ].
	^ nil
]

{ #category : #accessing }
BioException >> exceptionDate [
	^ exceptionDate
]

{ #category : #accessing }
BioException >> exceptionDate: anObject [
	exceptionDate := anObject
]

{ #category : #accessing }
BioException >> logger [

	^ self class logger
]

{ #category : #accessing }
BioException >> raiseWarning [
	^ self class raiseWarning
]

{ #category : #accessing }
BioException >> showWarning [
	^ self class showWarning
]

{ #category : #accessing }
BioException >> useLogger [
	" Answer <true> if logger usage is enabled "
	
	^ self class useLogger
]
