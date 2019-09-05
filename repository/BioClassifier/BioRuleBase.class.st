Class {
	#name : #BioRuleBase,
	#superclass : #BioObject,
	#instVars : [
		'context',
		'initRule'
	],
	#category : 'BioClassifier-RuleEngine'
}

{ #category : #accessing }
BioRuleBase >> context [
	^ context
]

{ #category : #accessing }
BioRuleBase >> context: anObject [
	context := anObject
]

{ #category : #accessing }
BioRuleBase >> evaluate: aCollection [

	^ self initRule 
		evaluate: aCollection 
		context: self context
]

{ #category : #accessing }
BioRuleBase >> initRule [
	^ initRule
]

{ #category : #accessing }
BioRuleBase >> initRule: anObject [
	^ initRule := anObject
]
