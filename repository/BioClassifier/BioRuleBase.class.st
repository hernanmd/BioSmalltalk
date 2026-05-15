"
Represents a rule base (knowledge base) for rule-based classification. Holds a context and an initial rule for evaluation. Instance Variables: context <Dictionary> Knowledge base context. initRule <BioBinaryRule> Initial rule.
"
Class {
	#name : 'BioRuleBase',
	#superclass : 'BioObject',
	#instVars : [
		'context',
		'initRule'
	],
	#category : 'BioClassifier-RuleEngine',
	#package : 'BioClassifier',
	#tag : 'RuleEngine'
}

{ #category : 'accessing' }
BioRuleBase >> context [
	^ context
]

{ #category : 'accessing' }
BioRuleBase >> context: anObject [
	context := anObject
]

{ #category : 'accessing' }
BioRuleBase >> evaluate: aCollection [

	^ self initRule 
		evaluate: aCollection 
		context: self context
]

{ #category : 'accessing' }
BioRuleBase >> initRule [
	^ initRule
]

{ #category : 'accessing' }
BioRuleBase >> initRule: anObject [
	^ initRule := anObject
]
