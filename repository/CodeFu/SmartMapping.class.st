Class {
	#name : #SmartMapping,
	#superclass : #NumberMapping,
	#instVars : [
		'parent'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
SmartMapping class >> on: parent [

	^(self new)
		setParent: parent;
		yourself
]

{ #category : #'initialize-release' }
SmartMapping >> isRoot [

	^parent isNil
]

{ #category : #'accessing - name' }
SmartMapping >> keyForName: name ifAbsent: exceptionBlock [

	^name isInteger ifTrue: [ name ] ifFalse: [  
		self isRoot ifTrue: [ exceptionBlock value ]
			ifFalse: [ self keyOf: (parent keyForName: name ifAbsent: exceptionBlock) ]
	]
]

{ #category : #'accessing - name' }
SmartMapping >> nameForKey: key [

	^self isRoot ifTrue: [ KeyNotFound raise ]
		ifFalse: [ parent nameForKey: (self atKey: key) ]
]

{ #category : #'initialize-release' }
SmartMapping >> setParent: mapping [

	^parent := mapping
]
