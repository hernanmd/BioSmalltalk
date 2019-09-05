"
BioFilter contains filtered results and manages its updates. 

By default a filter update its contents every time a filter is added to a reader with #addFilterFrom:. When #beCumulative is sent, instead of updating contents, this filter only returns the result of the filtering. This is useful for cases when you need to perform sucessive different filters over the same data set collecting new filter results.

Instance Variables:
	reader		<BioBlastReader>
	cumulative	<Boolean>
	contents		<BioFilteredResult>
"
Class {
	#name : #BioFilter,
	#superclass : #BioNamedObject,
	#instVars : [
		'reader',
		'cumulative',
		'contents'
	],
	#category : #'BioTools-Query'
}

{ #category : #'instance creation' }
BioFilter class >> newFromCollection: aCollection [

	^ self new contents: aCollection
]

{ #category : #'instance creation' }
BioFilter class >> newFromReader: aReader [
	" Answer a new instance of the receiver setting its reader "

	^ self new reader: aReader
]

{ #category : #'instance creation' }
BioFilter class >> newFromXML: aFileLocation [

	^ self newFromReader: (self reader
			results: (self openFileNamed: aFileLocation);
			yourself)
]

{ #category : #accessing }
BioFilter >> addFilterFrom: collection [
	" Private -  Create a new result from aCollection and link the receiver to its reader "
	
	| filterResult |
	
	self bioLog: 'Filtering...' translated.
	filterResult := self newFilteredResult: collection.
	self isCumulativeFilter
		ifFalse: [ 
			self contents ifNotNil: [ self bioLog: 'Updating previous filtered result...' translated ].
			self contents: filterResult.
			self reader addFilter: self ]
		ifTrue: [ 
			| newFilter |
			(newFilter := self class newFromReader: self reader) contents: filterResult.
			self reader addFilter: newFilter ].
	^ filterResult
]

{ #category : #accessing }
BioFilter >> addFilteredResult: aFilteredResult [
	" Add aFilter to the receiver filtered results "

	self reader addFilter: self.
	^ (self contents includes: aFilteredResult)
		ifFalse: [ 
			aFilteredResult filter: self.
			self contents add: aFilteredResult ].

]

{ #category : #accessing }
BioFilter >> beCumulative [
	" Set the receiver to not update its reader's contents "
	
	cumulative := true
]

{ #category : #accessing }
BioFilter >> beSubtractive [
	" Set the receiver to not update its reader's contents "
	
	cumulative := false
]

{ #category : #accessing }
BioFilter >> contents [
	" Answer a GTSearchResult from the receiver "
	
	^ contents
]

{ #category : #accessing }
BioFilter >> contents: anObject [
	contents := anObject
]

{ #category : #accessing }
BioFilter >> defaultReaderClass [

	self subclassResponsibility
]

{ #category : #'iterating elements' }
BioFilter >> do: aBlock [
	"Refer to the comment in Collection|do:."
	
	^ contents do: aBlock
]

{ #category : #private }
BioFilter >> filteredResult [
	" Answer a <BioFilteredResult> "

	^ self contents
]

{ #category : #private }
BioFilter >> filteredResultContents [
	" Answer the filtered results <Collection> "

	^ self filteredResult contents
]

{ #category : #accessing }
BioFilter >> filtersCount [
	" Refer to comment in BioFilteredReader "

	^ self reader filtersCount
]

{ #category : #'initialize-release' }
BioFilter >> initialize [
	" Private - See superimplementor's comment "
	
	super initialize.
	cumulative := true.
]

{ #category : #testing }
BioFilter >> isCumulativeFilter [

	^ cumulative
]

{ #category : #testing }
BioFilter >> isEmpty [
	"Answer whether the receiver contains any elements."

	^ self contents isEmpty
]

{ #category : #accessing }
BioFilter >> lastResult [

	^ self contents contents
]

{ #category : #private }
BioFilter >> newFilteredResult: collection [
	" Answer a new filtered result object with contents from collection. If collection is splitted in several sub-collections, then join them "
	
	^ BioFilteredResult new result: collection
]

{ #category : #printing }
BioFilter >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	self contents isNil
		ifTrue: [ aStream nextPut: $- ]
		ifFalse: [ aStream
					nextPut: $(;
					nextPutAll: self contents size asString;
					nextPut: $) ]
]

{ #category : #accessing }
BioFilter >> reader [

	^ reader
		ifNil: [ reader := self defaultReaderClass new ]
]

{ #category : #accessing }
BioFilter >> reader: anObject [

	reader := anObject.

]

{ #category : #accessing }
BioFilter >> size [

	^ self contents size
]
