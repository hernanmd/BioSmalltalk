Class {
	#name : #MacOSGraphVizGenerator,
	#superclass : #FileBasedGraphVizGenerator,
	#category : 'GraphViz-Generators'
}

{ #category : #accessing }
MacOSGraphVizGenerator >> commandLineForFormat: outputFormat [

	| file |
	file := self outputCommandLineFileNameFor: outputFormat.
	
	^ String streamContents:
		[:stream |
		stream
			nextPutAll: self outputPathForCommandLine;
			nextPutAll: self dotFileName;
			nextPutAll: ' -T';
			nextPutAll: outputFormat;
			nextPutAll: ' -o ';
			nextPutAll: file]
]

{ #category : #generating }
MacOSGraphVizGenerator >> createMorph [

	^  [(PNGReadWriter createAFormFrom: (self generateType: #png)) first asMorph] 
		ensure: [self cleanUpIntermediateFilesAsAppropriate]
]

{ #category : #'as yet unclassified' }
MacOSGraphVizGenerator >> make: outputFormat [

	^ self 
		do: [self makeNoWait: outputFormat]
		blockUntilFileUpdated: (self outputPath, ':', self baseFileName, '.', outputFormat)
		waitingNoMoreThan: self durationToWaitForGenerating
]

{ #category : #'as yet unclassified' }
MacOSGraphVizGenerator >> outputCommandLineFileNameFor: extension [

	^ self outputPathForCommandLine, self baseFileName, '.', extension.

]

{ #category : #'as yet unclassified' }
MacOSGraphVizGenerator >> outputPathForCommandLine [

	| path |
	path := self outputPath
		copyReplaceAll: ':'
		with: '/'.
	path := path
		copyReplaceAll: ' '
		with: '\ '.
	(path endsWith: '/') ifFalse: [path := path, '/'].
	
	^ '/Volumes/', path

]

{ #category : #private }
MacOSGraphVizGenerator >> runOSProcess: command with: arguments [ 

	| helperCommand |
	helperCommand := '/Applications/GraphViz.app/Contents/MacOS/', command.
	helperCommand := helperCommand, ' ', arguments.

	self runWithSystemFramework: helperCommand.
	
]

{ #category : #'external calls' }
MacOSGraphVizGenerator >> runWithSystemFramework: string [
	^ self externalCallFailed 
]
