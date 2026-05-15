"
Represents a genome diagram for visualization. Contains tracks with features, title information, and layout properties. Instance Variables: tracks <Collection> Diagram tracks. title <String> Diagram title. name <String> Diagram name. start <Integer> Start position. end <Integer> End position. format <Symbol> Output format. circular <Boolean> Whether the genome is circular.
"
Class {
	#name : 'BioGenomeDiagram',
	#superclass : 'Object',
	#instVars : [
		'tracks',
		'title',
		'name',
		'start',
		'end',
		'format',
		'circular'
	],
	#category : 'BioSupport-Visualization',
	#package : 'BioSupport',
	#tag : 'Visualization'
}

{ #category : 'examples' }
BioGenomeDiagram class >> example01 [

	| gdFeatureSet gdTrackForFeatures gdDiagram |

	gdFeatureSet := BioGenomeDiagram newFeatureSet.
	gdTrackForFeatures := BioGenomeDiagram newTrackNamed: 'Annotated diagram 1'.
	gdDiagram := BioGenomeDiagram newDiagramNamed: 'Yesinia ...'.

	gdTrackForFeatures addSet: gdFeatureSet.
	gdDiagram addTrack: gdTrackForFeatures.

]

{ #category : 'examples' }
BioGenomeDiagram class >> example02 [

	| gdDiagram record gdTrackForFeatures gdFeatureSet |

	record := nil. " ?? "
	gdDiagram := BioGenome new title: 'Yesinia ...'.
	gdTrackForFeatures := gdDiagram newTrackNamed: 'Annotated Track...' number: 1.
	gdFeatureSet := gdTrackForFeatures newSet.
	gdFeatureSet color: { Color blue . Color green }.

	record featuresDo: [ : feature |
		gdFeatureSet 
			addFeature: feature;
			addFeature: feature named: 'My Gene' ].

	gdDiagram drawLinear.
	gdDiagram drawCircular.
	gdDiagram writeAsPDFNamed: 'ExportGD.pdf'.
	gdDiagram writeAsSVGNamed: 'ExportSVG.svg'.
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram class >> named: aName [
	^ self new name: aName; yourself
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram class >> newDiagramNamed: aName [
	^ self named: aName
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram class >> newFeatureSet [
	^ BioDiagramFeatureSet new
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram class >> newTrackNamed: aName [
	^ BioDiagramTrack named: aName
]

{ #category : 'accessing' }
BioGenomeDiagram >> addFeature: aFeature [
	self tracks ifEmpty: [ self addTrack: (BioDiagramTrack named: 'Features') ].
	^ self tracks last addFeature: aFeature
]

{ #category : 'accessing' }
BioGenomeDiagram >> addFeature: aFeature color: aColor [
	aFeature color: aColor.
	^ self addFeature: aFeature
]

{ #category : 'accessing' }
BioGenomeDiagram >> addFeature: aFeature named: aName [
	aFeature name: aName.
	^ self addFeature: aFeature
]

{ #category : 'accessing' }
BioGenomeDiagram >> addFeature: aFeature named: aName color: aColor [
	aFeature name: aName; color: aColor.
	^ self addFeature: aFeature
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> addTrack: aTrack [
	^ self tracks add: aTrack
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> basicDraw [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> circular [
	^ circular ifNil: [ circular := false ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> circular: aBoolean [
	circular := aBoolean
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> drawCircular [
	self format: #circular.
	self basicDraw
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> drawLinear [
	self format: #linear.
	self basicDraw
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> end [
	^ self tracks inject: nil into: [ :max :t | max ifNil: [ t end ] ifNotNil: [ max max: t end ] ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> featureCount [
	^ self tracks inject: 0 into: [ :sum :t | sum + t featureCount ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> format [
	^ format ifNil: [ format := #linear ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> format: aSymbol [
	format := aSymbol
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> isCircular [
	^ self format = #circular
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> isLinear [
	^ self format = #linear
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> length [
	^ self end - self start + 1
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> name [
	^ name
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> name: aString [
	name := aString
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> newFeatureSet [
	^ BioDiagramFeatureSet new
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> newTrackNamed: aName [
	| track |
	track := BioDiagramTrack named: aName.
	self addTrack: track.
	^ track
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> newTrackNamed: aName number: anInteger [
	| track |
	track := BioDiagramTrack named: aName number: anInteger.
	self addTrack: track.
	^ track
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> removeTrack: aTrack [
	^ self tracks remove: aTrack ifAbsent: [ nil ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> start [
	^ self tracks inject: nil into: [ :min :t | min ifNil: [ t start ] ifNotNil: [ min min: t start ] ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> title [
	^ title
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> title: aString [
	title := aString
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> trackCount [
	^ self tracks size
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> tracks [
	^ tracks ifNil: [ tracks := OrderedCollection new ]
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> tracks: aCollection [
	tracks := aCollection
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> writeAsPDFNamed: aFileName [
	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
BioGenomeDiagram >> writeAsSVGNamed: aFileName [
	self subclassResponsibility
]
