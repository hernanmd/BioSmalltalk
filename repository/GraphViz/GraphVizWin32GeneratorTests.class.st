Class {
	#name : #GraphVizWin32GeneratorTests,
	#superclass : #GraphVizBaseTests,
	#category : 'GraphViz-Tests'
}

{ #category : #'as yet unclassified' }
GraphVizWin32GeneratorTests class >> isAbstract [

	^ Smalltalk os platformName  = 'Win 32'
]

{ #category : #'as yet unclassified' }
GraphVizWin32GeneratorTests >> testCleanupAfterYourself [

	self should: [tempDir entries isEmpty].
	
	graph add: #A.
	graph asMorph.
	graph asXml.
	
	self should: [tempDir entries isEmpty].
]

{ #category : #'as yet unclassified' }
GraphVizWin32GeneratorTests >> testWaitForNewFile [

	| generator testFile  |
	generator := Win32GraphVizGenerator new.
	testFile := tempDir fullPathFor: 'testFile'.
	
	self should:
		[generator
			do: nil
			blockUntilFileUpdated: testFile
			waitingNoMoreThan: 1 second] raise: Error.
	
	self shouldnt:
		[generator
			do: [(tempDir forceNewFileNamed: 'testFile') nextPut: $.; close]
			blockUntilFileUpdated: testFile
			waitingNoMoreThan: 1 second] raise: Error
]

{ #category : #'as yet unclassified' }
GraphVizWin32GeneratorTests >> testWaitForNewerFile [

	| generator testFile |
	generator := Win32GraphVizGenerator new.
	testFile := tempDir fullPathFor: 'testFile'.
	
	(tempDir forceNewFileNamed: 'testFile') close.
	self should:
		[generator
			do: nil
			blockUntilFileUpdated: testFile
			waitingNoMoreThan: 1 second] raise: Error.	

	self shouldnt:
		[generator
			do: [(tempDir forceNewFileNamed: 'testFile') nextPut: $.; close]
			blockUntilFileUpdated: testFile
			waitingNoMoreThan: 1 second] raise: Error
]
