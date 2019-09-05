Class {
	#name : #IncrementNotification,
	#superclass : #Notification,
	#instVars : [
		'parameter'
	],
	#category : 'CodeFu'
}

{ #category : #'as yet unclassified' }
IncrementNotification class >> signalWith: n [
	^self new signalWith: n
]

{ #category : #accessing }
IncrementNotification >> signalWith: number [

	parameter := number.
	self signal 
]

{ #category : #accessing }
IncrementNotification >> ticks [
	"Answer the number of ticks were signalled."

	^parameter == nil
		ifTrue: [ 1 ]
		ifFalse: [ parameter ]
]
