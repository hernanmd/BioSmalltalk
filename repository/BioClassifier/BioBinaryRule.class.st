Class {
	#name : #BioBinaryRule,
	#superclass : #BioRule,
	#instVars : [
		'explanation',
		'nextTrue',
		'nextFalse'
	],
	#category : 'BioClassifier-RuleEngine'
}

{ #category : #'instance creation' }
BioBinaryRule class >> name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule [

	^ self new
		name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		yourself
]

{ #category : #'instance creation' }
BioBinaryRule class >> name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule context: aContextObject [

	^ self new
		name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		context: aContextObject;
		yourself
]

{ #category : #accessing }
BioBinaryRule >> evaluate: subject [

	(super evaluate: subject)
		ifTrue: [ self nextTrue evaluate: subject ]
		ifFalse: [ self nextFalse evaluate: subject ]
]

{ #category : #accessing }
BioBinaryRule >> evaluate: subject context: aContext [

	(super evaluate: subject context: aContext)
		ifTrue: [ self nextTrue evaluate: subject context: aContext ]
		ifFalse: [ self nextFalse evaluate: subject context: aContext ]
]

{ #category : #accessing }
BioBinaryRule >> explanation [
	^ explanation
]

{ #category : #accessing }
BioBinaryRule >> explanation: anObject [
	explanation := anObject
]

{ #category : #accessing }
BioBinaryRule >> name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule [

	^ self name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		yourself
]

{ #category : #accessing }
BioBinaryRule >> name: aString if: conditionBlockOrSymbol true: trueRule false: falseRule context: aContextObject [

	^ self name: aString;
		condition: conditionBlockOrSymbol;
		nextTrue: trueRule;
		nextFalse: falseRule;
		context: aContextObject;
		yourself
]

{ #category : #accessing }
BioBinaryRule >> nextFalse [
	^ nextFalse
]

{ #category : #accessing }
BioBinaryRule >> nextFalse: anObject [
	nextFalse := anObject
]

{ #category : #accessing }
BioBinaryRule >> nextTrue [
	^ nextTrue
]

{ #category : #accessing }
BioBinaryRule >> nextTrue: anObject [
	nextTrue := anObject
]

{ #category : #accessing }
BioBinaryRule >> rules [

	^ Array 
		with: self nextFalse 
		with: self nextTrue
]
