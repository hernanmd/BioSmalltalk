"
BioFilteredReader is a reader which incorporates filtering capabilities.

filterClass 		<Class>		Stores a BioFilter class which is instantiated through #filter message.
"
Class {
	#name : #BioFilteredReader,
	#superclass : #BioReader,
	#instVars : [
		'filters',
		'filterClass',
		'queryFilters',
		'classifier'
	],
	#category : #'BioTools-IO'
}

{ #category : #'instance creation' }
BioFilteredReader class >> newFromFilter: aBioFilter [
	" Answer a new reader using file located at aFileLocationOrString "

	^ self new
		results: aBioFilter contents;
		yourself
]

{ #category : #'accessing filters' }
BioFilteredReader >> addFilter: aFilter [
	" Add aFilter to the receiver filtered results "

	(self filters includes: aFilter)
		ifFalse: [ self filters add: (aFilter name: self filters size + 1) ].
	^ aFilter
]

{ #category : #'accessing-query filters' }
BioFilteredReader >> addQueryFilter: anObject [

	self queryFilters add: anObject
]

{ #category : #'accessing filters' }
BioFilteredReader >> addResult [
	" Add a new result object to the receiver from the receiver's raw contents "

	self subclassResponsibility
]

{ #category : #accessing }
BioFilteredReader >> classifier [
	^ classifier
]

{ #category : #accessing }
BioFilteredReader >> classifier: anObject [
	classifier := anObject
]

{ #category : #accessing }
BioFilteredReader >> contents [
	" This is the <filtering> protocol. Answer a BioSearchResult, if the receiver already contains filters then answer the result object given by the last filter "
	
	^ self filters isEmpty
		ifTrue: [ self addResult ]
		ifFalse: [ self lastFilter contents ]
]

{ #category : #'accessing filters' }
BioFilteredReader >> filter [
	" Answer a filterer for selecting specific results from the receiver "
	
	^ self subclassResponsibility
]

{ #category : #accessing }
BioFilteredReader >> filterClass [

	^ filterClass
		ifNil: [ filterClass := self defaultFilterClass ]
]

{ #category : #accessing }
BioFilteredReader >> filterClass: anObject [
	filterClass := anObject
]

{ #category : #'accessing filters' }
BioFilteredReader >> filters [
	" Answer a filterer for selecting specific results from the receiver "
	
	^ filters
		ifNil: [ filters := OrderedCollection new ]

]

{ #category : #'accessing filters' }
BioFilteredReader >> filtersCount [
	" Answer a <Number> of how many filter results contains the receiver "
	
	^ self filters size
]

{ #category : #'accessing filters' }
BioFilteredReader >> hasCumulativeFilter [
	" Answer true if any of the receiver's filters is cumulative. This implies that subsequent filters
	will be applied to the found cumulative filter "
	
	^ self filters anySatisfy:[ : f | f isCumulativeFilter ]
]

{ #category : #'accessing filters' }
BioFilteredReader >> hasFilterResults [
	" Answer true if any of the receiver's filters is populated with results "
	
	^ self filters isEmpty not
]

{ #category : #'accessing filters' }
BioFilteredReader >> initialResult [
	" Answer the latest filtered result object in the receiver's filtered results "
	
	^ self contents first
]

{ #category : #'accessing filters' }
BioFilteredReader >> lastCumulativeFilter [
	" Answer the last filter from the receiver's filters which is cumulative "
	
	^ self filters reversed detect: #isCumulativeFilter
]

{ #category : #'accessing filters' }
BioFilteredReader >> lastFilter [

	^ self filters notEmpty
		ifTrue: [ self filters last ]
		ifFalse: [ nil ]
]

{ #category : #accessing }
BioFilteredReader >> queryFilters [
	^ queryFilters
		ifNil: [ queryFilters := OrderedCollection new ]
]

{ #category : #accessing }
BioFilteredReader >> queryFilters: anObject [
	queryFilters := anObject
]

{ #category : #'accessing filters' }
BioFilteredReader >> removeAllFilters [
	" Remove all filters in the receiver. Answer the receiver "

	self filters removeAll.
	self queryFilters removeAll.
]

{ #category : #'accessing filters' }
BioFilteredReader >> removeFilter: aFilter [
	" Add aFilter to the receiver filtered results. Answer the receiver "

	| queryFilter |

	(self filters includes: aFilter)
		ifTrue: [ self filters remove: aFilter ].
	(queryFilter := self queryFilters 
		detect: [ : msg | msg receiver = aFilter ]
		ifNone: [ nil ])
			ifNotNil: [ self queryFilters remove: queryFilter ]
]

{ #category : #'accessing-query filters' }
BioFilteredReader >> removeQueryFilter: anObject [

	self queryFilters remove: anObject
]

{ #category : #'accessing filters' }
BioFilteredReader >> result [
	" Answer the latest filtered result object in the receiver's filtered results "
	
	^ self lastResult
]
