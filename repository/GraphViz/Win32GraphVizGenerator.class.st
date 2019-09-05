Class {
	#name : #Win32GraphVizGenerator,
	#superclass : #FileBasedGraphVizGenerator,
	#category : 'GraphViz-Generators'
}

{ #category : #accessing }
Win32GraphVizGenerator >> commandLineForFormat: outputFormat [

	| file |
	file := self outputFileNameFor: outputFormat.
	
	^ String streamContents:
		[:stream |
		stream
			nextPut: $";
			nextPutAll: self dotFileName;
			nextPutAll: '" -T';
			nextPutAll: outputFormat;
			nextPutAll: ' -o "';
			nextPutAll: file;
			nextPut: $"]
]

{ #category : #creation }
Win32GraphVizGenerator >> createMorph [

	^  [(PNGReadWriter createAFormFrom: (self generateType: #png)) first asMorph] 
		ensure: [self cleanUpIntermediateFilesAsAppropriate]
]

{ #category : #creation }
Win32GraphVizGenerator >> createXMLDocument [

	| file parser xml |
	file := self make: #dot.
	
	file := self 
		do: [self launchDot2Gxl: file]
		blockUntilFileUpdated: (self outputFileNameFor: #xml)
		waitingNoMoreThan: self durationToWaitForGenerating.

	parser := Smalltalk at: #XMLDOMParser ifAbsent: [nil].
	xml := FileStream readOnlyFileNamed: file.
	^ [parser
		ifNil: [xml contents]
		ifNotNil: [parser parseDocumentFrom: xml]] ensure: [xml close. self cleanUpIntermediateFilesAsAppropriate]
]

{ #category : #external }
Win32GraphVizGenerator >> launchDot2Gxl: inputFile [

	| xmlFile |
	xmlFile := self outputFileNameFor: #xml.
	self
		runOSProcess: 'dot2gxl' 
		with: ('-o "', xmlFile, '" "', inputFile, '"').
		
	^ xmlFile
]

{ #category : #creation }
Win32GraphVizGenerator >> openInBrowser [

	| file |
	file := self  make: #svg.
	file := self writeHtmlSvgFor: file.

	Win32Shell new shellOpen: file
]

{ #category : #external }
Win32GraphVizGenerator >> runOSProcess: command with: arguments [

	| shell |
	shell := Win32Shell new.
	shell
		shellExecute: nil
		lpOperation: 'open'
		lpFile: command
		lpParameters: arguments
		lpDirectory: self outputPath
		nShowCmd: 0
]
