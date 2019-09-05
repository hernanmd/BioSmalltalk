Class {
	#name : #Accumulator,
	#superclass : #Object,
	#instVars : [
		'accumulateBlock',
		'size',
		'value',
		'index',
		'valueBlock'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
Accumulator class >> extreme [

	^self value: 0 using: [ :extreme :each | 
		extreme abs > each abs 
			ifTrue: [ extreme ]
			ifFalse: [ each ]
	]
]

{ #category : #'instance creation' }
Accumulator class >> maximum [

	^self value: Float infinity negated using: [ :max :each | max max: each ]
]

{ #category : #'instance creation' }
Accumulator class >> minimum [

	^self value: Float infinity using: [ :min :each | min min: each ]
]

{ #category : #'instance creation' }
Accumulator class >> new [

	self shouldNotImplement
]

{ #category : #'instance creation' }
Accumulator class >> squaredSum [

	^self value: 0 using: [ :sum :each | sum + each squared ]
]

{ #category : #'instance creation' }
Accumulator class >> sum [

	^self value: 0 using: [ :sum :each | sum + each ]
]

{ #category : #'instance creation' }
Accumulator class >> using: anAccumulationBlock [

	^self value: Number zero using: anAccumulationBlock
]

{ #category : #'instance creation' }
Accumulator class >> value: initialValue using: anAccumulationBlock [

	^self value: initialValue using: anAccumulationBlock finally: [:value :size | value]
]

{ #category : #accumulate }
Accumulator >> accumulate: aValue [ 

	size := size + 1.
	^value := (accumulateBlock value: value value: aValue).
]

{ #category : #accumulate }
Accumulator >> accumulate: aValue withIndex: anIndex [

	| oldValue changed |
	size := size + 1.
	oldValue := value.
	value := accumulateBlock value: value value: aValue.
	changed  := oldValue ~= value.
	changed ifTrue: [ index := anIndex ].
	^changed not
]

{ #category : #accumulate }
Accumulator >> add: aValue [

	^self accumulate: aValue
]

{ #category : #accessing }
Accumulator >> average [

	^value / size
]

{ #category : #accumulate }
Accumulator >> enumerate: aCollection [

	aCollection do: [ :each | self accumulate: each ].
	^value
]

{ #category : #accumulate }
Accumulator >> enumerate: aCollection atAll: indices [

	indices do: [ :key | self accumulate: (aCollection at: key) ].
	^value
]

{ #category : #accumulate }
Accumulator >> enumerate: aMatrix atAll: rowIndices andAll: columnIndices [

	rowIndices do: [ :row |
		columnIndices do: [ :column |
			self accumulate: (aMatrix at: row and: column) ] ].
	^value
]

{ #category : #accumulate }
Accumulator >> enumerateWithIndex: aSequencableCollection [

	aSequencableCollection doWithIndex: [ :each :index0 | self accumulate: each withIndex: index0 ].
	^value
]

{ #category : #accumulate }
Accumulator >> from: start to: end do: aBlock [

	start to: end do: [ :each |
		self accumulate: (aBlock value: each)
	].
	^value
]

{ #category : #accessing }
Accumulator >> index [

	^index
]

{ #category : #'initialize-release' }
Accumulator >> merge: anAccumulator [

	size := size + anAccumulator size.
	^self accumulate: anAccumulator value withIndex: anAccumulator index
]

{ #category : #printing }
Accumulator >> printOn: stream [

	| method |
	method := 	accumulateBlock method outerMethod.
	stream 
		nextPutAll: (method mclass == Accumulator class ifTrue: [ method selector ] ifFalse: [ 'custom' ]);
		space;
		nextPut: $=;
		space;
		print: value
]

{ #category : #'initialize-release' }
Accumulator >> resetValue: aValue [

	size := 0.
	index := nil.
	value := aValue
]

{ #category : #'initialize-release' }
Accumulator >> setAccumulateBlock: aBlock [
	
	accumulateBlock := aBlock
]

{ #category : #'initialize-release' }
Accumulator >> setValue: aValue [

	size := 0.
	^value := value
]

{ #category : #accessing }
Accumulator >> size [

	^size
]

{ #category : #accumulate }
Accumulator >> upTo: end do: aBlock [

	^self from: 1 to: end do: aBlock
]

{ #category : #accessing }
Accumulator >> value [

	^ valueBlock value: value value: size
]
