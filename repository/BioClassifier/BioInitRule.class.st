"
Represents an initialization rule for a rule-based classifier. Serves as the starting rule in a rule evaluation chain.
"
Class {
	#name : 'BioInitRule',
	#superclass : 'BioBinaryRule',
	#category : 'BioClassifier-RuleEngine',
	#package : 'BioClassifier',
	#tag : 'RuleEngine'
}

{ #category : 'accessing' }
BioInitRule >> evaluate: aCollection [
	" See superimplementor's comment "

	aCollection 
		do: [ : subject | 
			(self condition value: subject)
				ifTrue: [ self nextTrue evaluate: subject ]
				ifFalse: [ self nextFalse evaluate: subject ] ]
		displayingProgress: 'Classifying'
]

{ #category : 'accessing' }
BioInitRule >> evaluate: aCollection context: aContext [
	" See superimplementor's comment "

	aCollection 
		do: [: subject | 
			(self condition value: subject value: aContext)
				ifTrue: [ self nextTrue evaluate: subject context: aContext ]
				ifFalse: [ self nextFalse evaluate: subject context: aContext ] ]
		displayingProgress: 'Classifying'
]
