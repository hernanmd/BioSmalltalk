"
BioNCBIReader is a reader for data sets from the NCBI

Instance Variables:
	searchResults	<OrderedCollection>
	saveContents 	<Boolean>			Save contents of retrieved result sets to local workstation
"
Class {
	#name : #BioNCBIReader,
	#superclass : #BioFilteredReader,
	#instVars : [
		'querySeq',
		'results'
	],
	#category : 'BioBlast-Remote'
}

{ #category : #private }
BioNCBIReader class >> allowOpenTranscript [
	" Answer <true> if receiver is allowd to open a Transcript window to report log "

	^ true
]

{ #category : #'instance creation' }
BioNCBIReader class >> newFrom: aSearchResult [

	^ self new
		searchResults: aSearchResult;
		results: aSearchResult reader results;
		yourself
]

{ #category : #'accessing filters' }
BioNCBIReader >> addResult [
	" Add a new result object to the receiver from the receiver's raw contents "

	| newResult |
	
	newResult := (self resultClass new reader: self) result: self parsedContents.
	results ifNil: [ results := OrderedCollection new].
	(results includes: newResult)
		ifFalse: [ results add: newResult ].
	^ newResult
]

{ #category : #'accessing filters' }
BioNCBIReader >> filter [
	" Answer a filterer for selecting specific results from the receiver "
	
	^ ( self filters notEmpty and: [ self hasCumulativeFilter ] )
		ifFalse: [ self filterClass newFromReader: self ]
		ifTrue: [ self lastCumulativeFilter ]
]

{ #category : #testing }
BioNCBIReader >> hasResults [
	" Answer <true> if we have results "
	
	^ results notNil
]

{ #category : #accessing }
BioNCBIReader >> parsedContents [
	" Answer a <BioFilteredObject> "

	| rs |
	^ (rs := self results contents) isXML
		ifTrue: [ BioParser saxParseNcbiXmlBlastNodes: rs contents ]
		ifFalse: [ rs ]
]

{ #category : #private }
BioNCBIReader >> parserClass [
	" Answer a multi-purpose parser class. Override if necessary "

	^ BioParser

]

{ #category : #accessing }
BioNCBIReader >> querySequence [
	^ querySeq
]

{ #category : #accessing }
BioNCBIReader >> querySequence: anObject [
	querySeq := anObject
]

{ #category : #accessing }
BioNCBIReader >> searchResults [

	^ ( results isNil or: [ results isEmpty ] )
		ifTrue: [ results := self parsedContents ]
		ifFalse: [ results ]

]

{ #category : #accessing }
BioNCBIReader >> searchResults: anObject [
	results := anObject
]

{ #category : #accessing }
BioNCBIReader >> searchResultsSize [
	" Answer a <Number> with the receiver's count of hits "

	^ self searchResults last size

]
