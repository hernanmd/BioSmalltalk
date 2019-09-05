Class {
	#name : #GraphVizGenerator,
	#superclass : #Object,
	#instVars : [
		'outputPath',
		'graph',
		'preferredProgram'
	],
	#category : 'GraphViz-Generators'
}

{ #category : #'as yet unclassified' }
GraphVizGenerator class >> newFor: aGraphViz [

	| generator |
	generator := self new.
	generator graph: aGraphViz.
	
	^ generator
]

{ #category : #accessing }
GraphVizGenerator >> baseFileName [

	^ self graph name
]

{ #category : #creation }
GraphVizGenerator >> createMorph [

	"builds and returns a morph"
	self subclassResponsibility
]

{ #category : #creation }
GraphVizGenerator >> createXMLDocument [

	"builds and returns an XMLDocument"
	self subclassResponsibility
]

{ #category : #accessing }
GraphVizGenerator >> dotExtension [

	^ '.txt'
]

{ #category : #accessing }
GraphVizGenerator >> dotFileName [

	^ self baseFileName, self dotExtension
]

{ #category : #generating }
GraphVizGenerator >> evaluateUsing: externalProgram forType: outputFormat [

	self subclassResponsibility
]

{ #category : #generating }
GraphVizGenerator >> generateType: outputTypeString [
	"Run dot and produce a string with the requested output type. See the
	documentation for dot for a list of supported output types."

	^ self subclassResponsibility
]

{ #category : #accessing }
GraphVizGenerator >> graph [

	^ graph
]

{ #category : #accessing }
GraphVizGenerator >> graph: aGraphViz [

	graph := aGraphViz
]

{ #category : #accessing }
GraphVizGenerator >> htmlSvgStringFor: svgFile [

	^ String streamContents:
		[:stream |
		stream
			nextPutAll: '<html><head><title>';
			nextPutAll: self graph name;
			nextPutAll: '</title></head><body><object type="image/svg+xml" data="';
			nextPutAll: (FileDirectory localNameFor: svgFile);
			nextPutAll: '" width="100%" height="100%" /></body></html>']
	
]

{ #category : #generating }
GraphVizGenerator >> make: outputFormat [

	"makes the requested output format on disk and returns full filename to output file 
	e.g. write a SVG output file and returns full path to the output file"
	
	self subclassResponsibility
]

{ #category : #accessing }
GraphVizGenerator >> outputFileDirectory [

	| fileDirectory |
	fileDirectory := FileDirectory on: self outputPath.
	fileDirectory assureExistence.
	
	^ fileDirectory
]

{ #category : #accessing }
GraphVizGenerator >> outputFileNameFor: extension [

	^ self outputFileDirectory fullPathFor: (self baseFileName, '.', extension)
]

{ #category : #accessing }
GraphVizGenerator >> outputPath [

	^ outputPath ifNil: [(FileDirectory default directoryNamed: #dot) fullName]

]

{ #category : #accessing }
GraphVizGenerator >> outputPath: aString [

	outputPath := aString
]

{ #category : #accessing }
GraphVizGenerator >> preferredProgram [

	^ preferredProgram ifNil: [self graph isDirected ifTrue: ['dot'] ifFalse: ['neato']]

]

{ #category : #accessing }
GraphVizGenerator >> preferredProgram: aSymbol [

	preferredProgram := aSymbol
]

{ #category : #generating }
GraphVizGenerator >> writeDotFile [

	self writeDotFileNamed: self dotFileName
]

{ #category : #generating }
GraphVizGenerator >> writeDotFileNamed: aString [

	| fileName file |
	fileName := aString.
	(aString endsWith: self dotExtension) ifFalse: [fileName := fileName, self dotExtension].
	
	file := self outputFileDirectory forceNewFileNamed: fileName.
	[file nextPutAll: self graph dot] ensure: [file close]
]

{ #category : #generating }
GraphVizGenerator >> writeHtmlSvgFor: svgFile [

	| fileName html |
	fileName := self outputFileNameFor: #html.
	html := FileStream forceNewFileNamed: fileName.
	[html nextPutAll: (self htmlSvgStringFor: svgFile)] ensure: [html close].

	^ fileName
]
