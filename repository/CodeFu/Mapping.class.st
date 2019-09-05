Class {
	#name : #Mapping,
	#superclass : #Collection,
	#category : 'CodeFu'
}

{ #category : #adding }
Mapping >> add: newObject [

	self subclassResponsibility
]

{ #category : #accessing }
Mapping >> at: name [

	^self atKey: (self keyForName: name)
]

{ #category : #accessing }
Mapping >> at: name ifAbsent: exceptionBlock [

	^self atKey: (self keyForName: name ifAbsent: exceptionBlock) ifAbsent: exceptionBlock
]

{ #category : #accessing }
Mapping >> at: name ifPresent: unaryBlock [

	^unaryBlock value: (self at: name 
		ifAbsent: [ ^self ]).
]

{ #category : #'accessing - key' }
Mapping >> atKey: key [

	^self atKey: key ifAbsent: [ KeyNotFound raise ]
]

{ #category : #'accessing - key' }
Mapping >> atKey: aKey ifAbsent: exceptionBlock [

	^self subclassResponsibility
]

{ #category : #application }
Mapping >> convertCollection: aSequencableCollection [ 

	| collection |
	collection := aSequencableCollection species new.
	self do: [:index | collection add: (aSequencableCollection at: index)].
	^collection
]

{ #category : #application }
Mapping >> convertMatrixColumnwise: aMatrix [ 

	^aMatrix species withMatrix: (MappedMatrix on: aMatrix columnMap: self)
]

{ #category : #application }
Mapping >> convertMatrixRowwise: aMatrix [ 

	^aMatrix species withAll: (MappedMatrix on: aMatrix rowMap: self)
]

{ #category : #application }
Mapping >> convertSquareMatrix: aMatrix [ 

	^aMatrix species withMatrix: (MappedMatrix on: aMatrix map: self)
]

{ #category : #converting }
Mapping >> derive: aBlock [ 

	| derivate |
	derivate := SmartMapping new.
	derivate setParent: self.
	self do: [ :index | (aBlock value: index) ifTrue: [derivate add: index]].
	^derivate
]

{ #category : #converting }
Mapping >> deriveWithNames: names [

	| derivate |
	derivate := SmartMapping new.
	derivate setParent: self.
	names do: [ :name | derivate add: (self keyForName: name) ].
	^derivate
]

{ #category : #enumerating }
Mapping >> do: aBlock [

	self subclassResponsibility
]

{ #category : #testing }
Mapping >> includesIndex: index [

	self keyOf: index ifAbsent: [ ^false ].
	^true
]

{ #category : #testing }
Mapping >> includesKey: key [

	self atKey: key ifAbsent: [ ^false ].
	^true
]

{ #category : #testing }
Mapping >> includesName: name [

	self at: name ifAbsent: [ ^false ].
	^true
]

{ #category : #'user interface' }
Mapping >> inspectorClasses [

	^self size > 10000
		ifTrue:
			[Array with: BasicInspector]
		ifFalse:
			[Array
				with: DictionaryInspector
				with: BasicInspector]
]

{ #category : #'accessing - name' }
Mapping >> keyForName: name [

	^self keyForName: name ifAbsent: [ KeyNotFound raise ]
]

{ #category : #'accessing - name' }
Mapping >> keyForName: name ifAbsent: exceptionBlock [

	^self subclassResponsibility
]

{ #category : #'accessing - key' }
Mapping >> keyOf: index [

	^self keyOf: index ifAbsent: [ ValueNotFound raise ]
]

{ #category : #'accessing - key' }
Mapping >> keyOf: anIndex ifAbsent: exceptionBlock [

	^self subclassResponsibility
]

{ #category : #'accessing - key' }
Mapping >> keys [

	^self subclassResponsibility
]

{ #category : #'accessing - name' }
Mapping >> nameForKey: key [

	^self subclassResponsibility
]

{ #category : #'accessing - name' }
Mapping >> nameOf: index [

	^self nameForKey: (self keyOf: index)
]

{ #category : #'accessing - name' }
Mapping >> nameOf: index ifAbsent: exceptionBlock [

	^self nameForKey: (self keyOf: index ifAbsent: exceptionBlock)
]

{ #category : #'accessing - name' }
Mapping >> names [

	^self keys collect: [ :key | self nameForKey: key ]
]

{ #category : #removing }
Mapping >> remove: oldObject ifAbsent: anExceptionBlock [
	
	self shouldNotImplement
]

{ #category : #accessing }
Mapping >> size [

	^self subclassResponsibility
]

{ #category : #converting }
Mapping >> with: aCollection derive: aBlock [ 

	^self derive: [ :index | aBlock value: (aCollection at: index) ]
]
