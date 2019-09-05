Class {
	#name : #FileBasedGraphVizGenerator,
	#superclass : #GraphVizGenerator,
	#instVars : [
		'durationToWaitForGenerating',
		'deleteIntermediateFiles'
	],
	#category : 'GraphViz-Generators'
}

{ #category : #accessing }
FileBasedGraphVizGenerator >> beClean [

	deleteIntermediateFiles  := true
]

{ #category : #accessing }
FileBasedGraphVizGenerator >> beMessy [

	deleteIntermediateFiles  := false
]

{ #category : #private }
FileBasedGraphVizGenerator >> cleanUpIntermediateFilesAsAppropriate [

	| entries |
	deleteIntermediateFiles ifFalse: [^ self].
	
	self outputFileDirectory deleteFileNamed: self dotFileName.
	
	entries := self outputFileDirectory matchingEntries: (self baseFileName, '.*').
	entries do: [:each | self outputFileDirectory deleteFileNamed: each name]
]

{ #category : #generating }
FileBasedGraphVizGenerator >> commandLineForFormat: outputFormat [

	self subclassResponsibility
]

{ #category : #private }
FileBasedGraphVizGenerator >> do: aBlock blockUntilFileUpdated: file waitingNoMoreThan: duration [

	| originalModTime returnValue stopwatch |
	originalModTime := self modificationTimeOf: file.
	returnValue := aBlock value.
	
	stopwatch := Stopwatch new.
	stopwatch activate.
	
	[stopwatch duration < duration] whileTrue:
		[(self modificationTimeOf: file) ifNotNilDo:
			[:latestModTime | | testfile |

			"if file is openable for writing then probably the external process is done"
			testfile := FileStream fileNamed: file.
			testfile ifNotNil:
				[testfile close.				
				originalModTime
					ifNil: [^ returnValue] "file did not exist before and now exists"
					ifNotNil: [latestModTime > originalModTime ifTrue: [^ returnValue]]]].
		
		150 milliSeconds asDelay wait].
	
	self error: 'Timeout expired waiting for ', file, ' to be updated!'
]

{ #category : #accessing }
FileBasedGraphVizGenerator >> durationToWaitForGenerating [

	^ durationToWaitForGenerating ifNil: [30 seconds]
]

{ #category : #accessing }
FileBasedGraphVizGenerator >> durationToWaitForGenerating: aDuration [

	durationToWaitForGenerating := aDuration
]

{ #category : #generating }
FileBasedGraphVizGenerator >> evaluateUsing: externalProgram forType: outputFormat [

	self
		runOSProcess: externalProgram 
		with: (self commandLineForFormat: outputFormat)
]

{ #category : #generating }
FileBasedGraphVizGenerator >> generateType: outputTypeString [
	"Run dot and produce a string with the requested output type. See the
	documentation for dot for a list of supported output types."

	| fs converterClass |
	self make: outputTypeString.
	fs := FileStream readOnlyFileNamed: (self outputFileNameFor: outputTypeString).
	
	[converterClass := Smalltalk
		at: #Latin1TextConverter
		ifAbsent: [nil].
	converterClass ifNotNil: [fs converter: converterClass new].
	^ fs contentsOfEntireFile] ensure:
		[fs close.
		self cleanUpIntermediateFilesAsAppropriate]
]

{ #category : #initialization }
FileBasedGraphVizGenerator >> initialize [

	super initialize.
	self beClean
]

{ #category : #generating }
FileBasedGraphVizGenerator >> make: outputFormat [

	^ self 
		do: [self makeNoWait: outputFormat]
		blockUntilFileUpdated: (self outputFileNameFor: outputFormat)
		waitingNoMoreThan: self durationToWaitForGenerating
]

{ #category : #generating }
FileBasedGraphVizGenerator >> makeNoWait: outputFormat [

	self writeDotFile.
	self evaluateUsing: self preferredProgram forType: outputFormat.
	
	^ self outputFileNameFor: outputFormat
]

{ #category : #accessing }
FileBasedGraphVizGenerator >> modificationTimeOf: aString [

	^ (FileDirectory directoryEntryFor: aString) ifNotNilDo: [:entry | entry modificationTime]
]

{ #category : #external }
FileBasedGraphVizGenerator >> runOSProcess: command with: arguments [ 

	self subclassResponsibility
]
