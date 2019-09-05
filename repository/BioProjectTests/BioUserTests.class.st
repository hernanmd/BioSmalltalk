Class {
	#name : #BioUserTests,
	#superclass : #TestCase,
	#instVars : [
		'user'
	],
	#category : 'BioProjectTests-Core'
}

{ #category : #testing }
BioUserTests >> test1UserCreation [

	user := BioUser named: self userTestName.
	self assert: (user isKindOf: BioUser).
	self assert: user userName equals: self userTestName.



]

{ #category : #testing }
BioUserTests >> userTestName [

	^ 'TestUser'
]
