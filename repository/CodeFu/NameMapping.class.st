Class {
	#name : #NameMapping,
	#superclass : #Mapping,
	#instVars : [
		'names',
		'comparisonBlock'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
NameMapping class >> new [

	^(super new) 
		initialize;
		forEquality;
		yourself
]

{ #category : #'instance creation' }
NameMapping class >> new: size [

 ^ self new
]

{ #category : #'instance creation' }
NameMapping class >> newUsing: aComparisonBlock [

	^(super new) 
		initialize;
		setComparisonBlock: aComparisonBlock;
		yourself
]

{ #category : #adding }
NameMapping >> add: name [ 

	(self includesName: name) ifTrue: [ Error raise ].
	names addLast: name.
	^self size
]

{ #category : #accessing }
NameMapping >> atKey: key ifAbsent: exceptionBlock [

	^(key between: 1 and: self size)
		ifTrue: [ key ]
		ifFalse: [ exceptionBlock value ]
]

{ #category : #enumerating }
NameMapping >> do: aBlock [ 

	1 to: self size do: [ :each | aBlock value: each ]
]

{ #category : #'initialize-release' }
NameMapping >> forEquality [

	self setComparisonBlock: [:a :b | a = b].
]

{ #category : #'initialize-release' }
NameMapping >> forIdentity [

	self setComparisonBlock: [:a :b | a == b].
]

{ #category : #testing }
NameMapping >> includesName: name [

	^names contains: [ :each | comparisonBlock value: each value: name ]
]

{ #category : #'initialize-release' }
NameMapping >> initialize [

	names := OrderedCollection new
]

{ #category : #'accessing - name' }
NameMapping >> keyForName: name ifAbsent: exceptionBlock [

	^name isInteger 
		ifTrue: [ name ]
		ifFalse: [ names 
			findFirst: [ :each | comparisonBlock value: name value: each ] 
			ifAbsent: [ exceptionBlock value ]
		].
]

{ #category : #accessing }
NameMapping >> keyOf: anIndex ifAbsent: exceptionBlock [

	^self atKey: anIndex ifAbsent: exceptionBlock
]

{ #category : #'accessing - name' }
NameMapping >> keys [

	^names
]

{ #category : #'accessing - name' }
NameMapping >> nameForKey: key [

	^names at: key
]

{ #category : #'accessing - name' }
NameMapping >> names [

	^names
]

{ #category : #'initialize-release' }
NameMapping >> setComparisonBlock: aComparisonBlock [

	^comparisonBlock := aComparisonBlock
]

{ #category : #accessing }
NameMapping >> size [

	^names size
]
