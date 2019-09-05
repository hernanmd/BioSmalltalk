"
Main interface object to work in a controlled/organized way. Using a project you will be able to track your actions whithin a work context and organize your tasks in jobs. 

- The tracking of important information is accomplished via a BioProjectInformation object, which includes history, usage and security.

- A project contains a collection of jobs where you can store related jobs with sequences whithin a project. In this sense a project could be a Master Thesis or Original Research Paper and the jobs could be a collection with a BioJob for mutation searching and another BioJob association of polymorphisms, etc.

"
Class {
	#name : #BioProject,
	#superclass : #PFProjectBase,
	#instVars : [
		'jobs'
	],
	#category : 'BioProject-Core'
}

{ #category : #comparing }
BioProject >> = aBioProject [
	" Answer <true> if receiver has the same name, information and usage as aBioProject "

	self == aBioProject
		ifTrue: [ ^ true ].
	self class = aBioProject class
		ifFalse: [ ^ false ].
	self info = aBioProject info
		ifFalse: [ ^ false ].
	self jobs = aBioProject jobs
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #'accessing-sequences' }
BioProject >> addJob: aBioJob [
	" Add aBioJob to the receiver's jobs "
	
	^ self jobs addLast: aBioJob; yourself
]

{ #category : #'accessing-sequences' }
BioProject >> addSequence: aBioSequence [
	" Add aBioSequence to the receiver's first job "
	
	self hasJobs
		ifFalse: [
			| newJob |
			newJob := BioJob new.
			newJob addSequence: aBioSequence.
			self addJob: newJob ]
		ifTrue: [
			| job |
			job := self jobs first.
			job addSequence: aBioSequence ].
]

{ #category : #'accessing-usage' }
BioProject >> hasJobs [
	" Answer a Number with the number of jobs in the receiver "
	
	^ self jobsCount ~= 0
]

{ #category : #comparing }
BioProject >> hash [
	" Private - hash is implemented because #= is implemented "

	^ self info hash bitXor: self jobs hash

]

{ #category : #accessing }
BioProject >> jobs [

	^ jobs
		ifNil: [ jobs := OrderedCollection new ]
]

{ #category : #'accessing-usage' }
BioProject >> jobsCount [
	" Answer a Number with the number of jobs in the receiver "
	
	^ self jobs size
]

{ #category : #printing }
BioProject >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self projectName between: $( and: $);
		space;
		nextPutAll: 'Jobs: ';
		nextPutAll: self jobsCount asString
]

{ #category : #'initialize-release' }
BioProject >> release [
	" Release all receiver's objects "
	
	super release.
	info := nil.
	jobs := nil.
]

{ #category : #'accessing-sequences' }
BioProject >> removeSequence: aBioSequence [
	" Remove aBioSequence from the receiver's first job which includes aBioSequence "

	| jobOrNil |
	jobOrNil := self jobs
		detect: [ :job | job includesSequence: aBioSequence ]
		ifNone: [ nil ].
	jobOrNil
		ifNotNil: [ :job | job removeSequence: aBioSequence ]
		ifNil: [ BioObject signalNotFound: 'Sequence not found ' , aBioSequence greaseString ]
]

{ #category : #'accessing-sequences' }
BioProject >> sequenceCount [
	" Answer a Number of the receiver's working sequences "
	
	^ self jobs isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ self jobs sum: #sequenceCount ]
]

{ #category : #'accessing-sequences' }
BioProject >> sequences [
	" Answer a <Collection> of all receiver's job sequences "
	
	^ self jobs flatCollect: #sequences
]
