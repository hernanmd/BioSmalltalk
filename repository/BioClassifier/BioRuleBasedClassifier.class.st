"
Implements basic behavior for rule-based classification.

"
Class {
	#name : #BioRuleBasedClassifier,
	#superclass : #BioClassifier,
	#instVars : [
		'ruleBases',
		'currentRuleBase'
	],
	#category : 'BioClassifier-Core'
}

{ #category : #accessing }
BioRuleBasedClassifier >> currentRuleBase [
	" Answer an instance of receiver's rule container <BioRuleBase> "
	^ currentRuleBase
		ifNil: [ currentRuleBase := self defaultRuleBase ]
]

{ #category : #accessing }
BioRuleBasedClassifier >> currentRuleBase: anObject [
	currentRuleBase := anObject
]

{ #category : #private }
BioRuleBasedClassifier >> defaultRuleBase [
	" Private - See comment in #ruleBase "

	^ BioRuleBase new 
]

{ #category : #accessing }
BioRuleBasedClassifier >> ruleBases [
	" Answer a <Collection> containing the receiver's rule base instances "

	^ ruleBases
		ifNil: [ ruleBases := Set new ]
]

{ #category : #accessing }
BioRuleBasedClassifier >> setRuleClass: ruleClass [ 
	" See comment in #setRuleClass: 
	Set only a new organization if selected ruleClass is different from current organization "

	self ruleBases 
		detect: [ : rb | rb isKindOf: ruleClass ]
		ifFound: [ : foundRb | self currentRuleBase: foundRb ]
		ifNone: [ 
			self currentRuleBase: (ruleClass newForClassifier: self).
			self ruleBases add: self currentRuleBase ].
	(self organization isKindOf: ruleClass organizationClass)
		ifFalse: [ self organization: ruleClass organizationClass new ]
]
